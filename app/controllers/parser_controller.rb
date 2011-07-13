class ParserController < ApplicationController
  def parser
    
     
    @jobs = Job.all
    @parse= Result.all
    @jobIterator =0
    @jobToDo = Job.first.url
    @result = Result.body
    
  
    @parse.each do |x|
     @doc = Nokogiri::HTML(@result) 
     @doc.css('title')
     puts @doc
    end
  end
end

#    @jobs = Job.all
#    @jobIterator =0
#    @jobToDo = Job.first.url
#    #puts "JOB ITERATOR: "
#    #puts @jobIterator
#    #    puts "JOBs: "
#    #    puts @jobs
#
#    @jobs.each do |x|
#      Anemone.crawl(@jobToDo) do |anemone|
#        
#        titles = []
#        anemone.on_every_page { |page| titles.push page.doc.at('title').inner_html rescue nil }
#        anemone.after_crawl { puts titles.compact.sort }


      
#        anemone.on_every_page do |page|
#          puts"URL: "
#          puts page.url
#          puts"               "
#          #puts"ALIASES: "
#          #puts page.alias
#          #puts"HEADERS: "
#          puts page.headers
#          puts"               "
#          puts"CODE: "
#          puts page.code
#          puts"               "
#          #puts"BODY: "
#          # puts page.body
#          #puts"               "
#          #puts"DOC: "
#          puts page.doc
#          puts"               "
#          puts"LINKS: "
#          puts page.links
#          puts"               "
#          puts"               "
#          puts"               "
#          puts"               "
#        end
#        anemone.after_crawl do |cleanup|
#          puts "         TESTESTESTESTESTES      "
#          puts YAML::dump(@requestBeingFilled)
        #update requests status to Parsing
          #@requestBeingFilled.status ='Finished inventory, Waiting parse request'
#          #@requestBeingFilled.save
#        end
#      end
#    end
#  end

#  def parse
#    @jobs = Job.all
#    @jobIterator =0
#    #puts "initial JOB ITERATOR: "
#    #puts @jobIterator# this is here to make sure its not nil
#
#    @jobs.each do |x|
#    #puts "JOB TO COMPARE"
#    #puts YAML::dump(@jobs[@jobIterator])
#
#      Anemone.crawl(@jobs[@jobIterator].url) do |anemone|
#        anemone.focus_crawl{|page|page.links.slice(0..1)}
#
#        puts "parsing: "+@jobs[@jobIterator].url
#        @jobIterator +=1
#      end
#    end
#  end
#end

#check information of parser's current page  end
