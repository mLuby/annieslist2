class Restaurant < ActiveRecord::Base
  attr_accessible :address, :link, :name, :phone
  belongs_to :location
  has_many :visits
end
