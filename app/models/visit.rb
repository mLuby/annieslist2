class Visit < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_id, :id
  belongs_to :user 
  belongs_to :restaurant
end
