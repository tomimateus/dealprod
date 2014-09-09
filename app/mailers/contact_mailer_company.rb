class ContactMailerCompany < ActionMailer::Base

  default :from =>  "noresponder@dealhunter.com"
  default :to => "laura_lopez_bukovac@hotmail.com"

  def new_message_company(message)
    @message = message
    mail(:subject => "[Dealhunter-contacto-empresa-Alta]")
  end

end
