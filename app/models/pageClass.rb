class pageClass < ActiveRecord::Base
  
 has_many :pages
 
def self.find_all_unpaid
  self.where('paid =0')
end

def total
  sum =0
  page.each {|li| sum += li.total}
end
def url
  @url
end
def depth
  @depth
end

end
