task :cron => :environment do
  Client.all.each do |c|
    print(c.user.email)
    NewUserMailer.new_client_email(c.user).deliver
    print("Se envio algo")
  end
end

task :daily_news_cron => :environment do
  Client.all.each do |client|
    unless client.newsletter_frequency.nil?
      if client.newsletter_frequency.days == 7
        NewsletterMailer.newsletter_email(client).deliver
      end
    end
  end
end

task :week_news_cron => :environment do
  Client.all.each do |client|
    if client.newsletter_frequency.days == 1
      NewsletterMailer.newsletter_email(client).deliver
    end
  end
end