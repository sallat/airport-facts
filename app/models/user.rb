class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  # attr_accessible :title, :body
  
  has_many :reviews
  has_many :airfields, :through => :reviews
  
  attr_accessible :avatar
  if Rails.env.production?
  has_attached_file :avatar,

  :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :storage => :s3,
    :url => ":s3_domain_url",
    :path => "/:class/avatars/:id_:basename.:style.:extension",
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
else
  has_attached_file :avatar,
   :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
  validates_attachment_content_type :avatar, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/pjepg', 'image/x-png', 'image/pjpeg']
end
