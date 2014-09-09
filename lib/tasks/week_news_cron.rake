task :week_news_cron => :environment do
  Client.all.each do |client|
    if client.newsletter_frequency.days == 1
      NewsletterMailer.newsletter_email(client).deliver
      end
  end
end