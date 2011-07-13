class Result < ActiveRecord::Base

require 'rest-uri'
  
  after_save :notify_repository

  def notify_repository
    
    RestClient.post (http://127.0.0.1:3001/websites,to_json)
  end


end
