class Request < ActionMailer::Base
  default from: "myappmailer123@gmail.com", bcc: "myappmailer123@gmail.com"
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def contact_us(contact)
    @contact = contact
    mail to: contact.email, subject:"User Feedback"
  end
end
