task :daily_news_cron => :environment do
  Client.all.each do |client|
    unless client.newsletter_frequency.nil?
      if client.newsletter_frequency.days == 7
        NewsletterMailer.newsletter_email(client).deliver
      end
    end
  end
end