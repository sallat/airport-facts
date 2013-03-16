class Contact < ActiveRecord::Base
  attr_accessible :comment, :email, :name, :subject
  
  after_validation :on => :create
  
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true, length: { maximum: 20 }
  validates :comment, presence: true
end
