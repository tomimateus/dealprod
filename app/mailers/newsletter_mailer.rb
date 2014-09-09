class NewsletterMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def newsletter_email(client)
    offers=Array.new
    Offer.all.each do |offer|
      if offer.weight(client.id)>0
        offers.append(offer)
      end
    end
    @offers=offers.sort_by {|e| e.current_weight}.reverse.take(6)
    #clients_titles = ClientsTitles.select("title_id").where(:client_id => client.id)
    #@offers = Offer.actual.where(:id => OffersTitles.select("offer_id").where(:title_id => clients_titles)).all.take(6)
    mail(:to => "kevstessens@gmail.com", :subject => "Newsletter Dealhunter")
    #mail(:to => client.email, :subject => "Newsletter Dealhunter")

  end

end