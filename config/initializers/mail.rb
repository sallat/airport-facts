if Rails.env.production?

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp

else
  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "myappmailer123@gmail.com",
    :password => 'Sinikka4',
    :authentication => "plain",
    :enable_starttls_auto => true}
  
  ActionMailer::Base.delivery_method = :smtp

end
  