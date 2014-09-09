class ContactMailerTrabajaConNosotros < ActionMailer::Base

  default :from =>  "noresponder@dealhunter.com"
  default :to => "damianminniti@hotmail.com"

  def new_message_trabaja_con_nosotros(message)
    @message = message
    mail(:subject => "[Dealhunter-contacto-busqueda-laboral]")
  end

end
