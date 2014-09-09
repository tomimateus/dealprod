class OfferStartMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def offer_start_email(user, offer)
    @user = user
    @offer = offer

    mail(:to => user.email, :subject => "Comienza tu oferta!")
  end

end