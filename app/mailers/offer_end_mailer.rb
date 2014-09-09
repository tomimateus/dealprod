class OfferEndMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def offer_end_email(user, offer)
    @user = user
    @offer = offer
    mail(:to => user.email, :subject => "Ha finalizado tu oferta!")
    #mail(:to => "tatiana.slod@gmail.com", :subject => "Ha finalizado tu oferta!")
  end

end