class ParserController < ApplicationController
  def parser

    @jobs = Job.all
    @parse= Result.all
    @jobIterator =0
    @jobToDo = Job.first.url
    
    
     # f  = File.open('title.txt'     , 'w' )
         
    @jobs.each do |x|
      Anemone.crawl(@jobToDo) do |anemone|
#        
#        titles = []
#        anemone.on_every_page { |page| titles.push page.doc.at('title').inner_html rescue nil }
#        anemone.after_crawl { f.puts titles.compact.sort }
#        f.save
#        end
        # puts YAML::dump(@jobToDo)
         titles = []

         anemone.on_every_page do |page| 
           #logger.debug page.url
             
          #logger.debug page.doc.attribute('title').inner_html if page.doc.attribute('title')

           temp_repositories = TempRepository.new(
            :title => page.doc.at('links'),
            :html => page.doc.at('url') ,
            :http => page.doc.at('code'),
            :url => page.url.to_s, 
            :parentRequest => Request.first.id.to_s,
            :head => page.headers.to_s, 
            :body => page.body.to_s ,
            :respCode => (page.code.to_s),
            :links => page.links,
            :arr  => page.doc.at('body')
          )
          temp_repositories.save

          end
      
      end
          
          
#  def files(urls)
#          
#		arr_files = Array.new
#		arr_words = Array.new
#		urls.each do |link|
#		arr_words = link.split(".")
#			case arr_words[-1]
#				when "pdf" then arr_files    << link
#				when "swf" then arr_files    << link
#				when "doc" then arr_files    << link
#				when "xls" then arr_files    << link
#				when "mdb" then arr_files    << link
#				when "txt" then arr_files    << link
#				when "ppt" then arr_files    << link
#				when "pptx" then arr_files   << link
#				when "docx" then arr_files   << link
#				when "xlsx" then arr_files   << link
#				when "mdb" then arr_files    << link
#				when "nsf" then arr_files    << link
#				when "cfg" then arr_files    << link
#				when "xml" then arr_files    << link
#				when "passwd" then arr_files << link
#				when "js" then arr_files     << link
#				when "jar" then arr_files    << link
#				when "class" then arr_files  << link		  
#			end
#		end
#		return arr_files.uniq
#	end
#	
#	def clean_files(arr_files)
#		arr_files.each do |file|
#			@arrLink.delete(file)
#			@arrNew.delete(file)
#		end
#	end
#           anemone.after_crawl do |cleanup|
#             @requestBeingFilled.status ='Finished Parsing, check your inventory'
#              @requestBeingFilled.save
      #  end
     end
    end
  end
  
  def api_add()
    puts YAML::dump(params)
  end


  def parse
    @jobs = Job.all
    @jobIterator =0
    #puts "initial JOB ITERATOR: "
    #puts @jobIterator# this is here to make sure its not nil
    @jobs.each do |x|
    #puts "JOB TO COMPARE"
    #puts YAML::dump(@jobs[@jobIterator])
      Anemone.crawl(@jobs[@jobIterator].url) do |anemone|
        anemone.focus_crawl{|page|page.links.slice(0..1)}
        puts "parsing: "+@jobs[@jobIterator].url
        @jobIterator +=1
      end
    end
  end
  
  




#check information of parser's current page 
