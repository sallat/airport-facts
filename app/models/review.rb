class Review < ActiveRecord::Base
  attr_accessible :airfield_id, :rating, :review, :user_id
  
  belongs_to :airfield
  belongs_to :user
end
