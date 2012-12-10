class Location < ActiveRecord::Base
  has_many :restaurants, :dependent => :destroy

  accepts_nested_attributes_for :restaurants
  
  attr_accessible :name, :restaurants_attributes
end
