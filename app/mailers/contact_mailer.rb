class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    
    
    mail to: ENV['MAIL'], subject: "favbooksの問い合わせ"
  end
end
