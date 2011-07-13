class Request < ActiveRecord::Base
  validates :url, :presence => true
  validates :depth, :numericality => {:greater_than_or_equal_to => 0}
  validates :url, :uniqueness =>true
end
