class Restaurant < ActiveRecord::Base
  attr_accessible :name, :link, :address, :phone, :location_id 
  belongs_to :location
  has_many :visits, :dependent => :destroy
end
