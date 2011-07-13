class CrawlController < ApplicationController
  def show
   # db = SQLite3::Database.new( "jobs.db" )
   # @sitesToCrawl = db.execute("SELECT url FROM jobs;")
        
    
    @jobs = Job.all
    @requests = Request.all
    
    #puts "TEST TEST TEST"
    #puts YAML::dump(Request.first.url)
 
    ##This needs to be changed to whatever the first URL is
    @usersRequestedSite = Request.first.url
    @usersRequestedDepth = Request.first.depth
    #userRequested sites should be generated from form
    @requestBeingFilled = Request.find_by_url(@usersRequestedSite)
    @jobBeingDone = Job.find_by_url("http://"+@usersRequestedSite+"/")
    
   
    #puts "REQUEST TO COMPARE"
    #puts YAML::dump(@requestToUpdate)
    #puts "JOB TO COMPARE"
    #puts YAML::dump(@jobBeingDone)
   #Rohans ping code. still to be tested. not working due to missing gem
   # loop do
   # resp = nil
   # t = Benchmark.measure {
   #    resp = Curl::Easy.perform(ARGV[0])
   #   }
   #   puts "#{resp.response_code} : #{t}"
   # end
    
    Anemone.crawl("http://"+@usersRequestedSite, :depth_limit =>@usersRequestedDepth ) do |anemone|
      anemone.on_every_page do |page|
        puts page.url 
       
        if @requestBeingFilled.nil?
          puts 'ERROR: the request has a problem or doesnt exist'
          # if theres no job there. make a new one
          
          else if @jobBeingDone.nil?
            puts "ERROR: The job does not exist. Creating"
            @job = Job.new (:url => page.url.to_s, :depth => page.depth.to_s, :parentRequest => Request.first.id)
            @job.save()
          
            # This is a pretty convoluted string comparrison. 
            # jobto compare starts with http:// and ends wioth a "/"  Therefore they have been included in this
            else if (("http://"+@requestBeingFilled.url+"/").eql? @jobBeingDone.url)
              puts 'This job is already listed'
          
            else 
              @job = Job.new (:url => page.url.to_s, :depth => page.depth.to_s, :parentRequest => Request.first.id)
              @job.save()
             end
              anemone.after_crawl do |cleanup|
              #update requests status to Parsing
              @requestBeingFilled.status ='Finished job inventory, Waiting parse results'
              @requestBeingFilled.save
             
              #This is the parser part of the program. Go from here to sort and store information.
              #05/07/2011    The parser is being handled by another controller and link for now.
              #Anemone.crawl()
            end
          end
          end
        end
      end
      Anemone.crawl("http://"+@usersRequestedSite, :depth_limit =>@usersRequestedDepth ) do |anemone|
        anemone.on_every_page do |page|
          puts "CRAWLCRAWLCRAWLCRAAWL"
            @result = Result.new (
            :title => ' ',
            :url => page.url.to_s, 
            :depth => page.depth.to_s, 
            :parentRequest => Request.first.id.to_s,
            :head => page.headers.to_s, 
            :body => page.body.to_s ,
            :page => page.headers.to_s + page.body.to_s,
            :respCode => (page.code.to_s),
            :links => page.links, 
            :description => 'Blank',
            :comment => 'Blank'
            )
            @result.save()
          end
        end
      end




  
  def api_add()
    
    puts YAML::dump(params)
    @post = Request.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
      
  end


    #db = SQLite3::Database.new( "jobs.db" )
        #@sitesToCrawl = db.execute("SELECT url FROM jobs;")

    #@sitesToCrawl.each {|x|puts @jobs<<x.url }
    
    #@sitesToCrawl.each do |job|
    #puts x.url
    #  @jobs<<job.url
    
    #Anemone.crawl("http://"+@sitesToCrawl.to_s) do |anemone|