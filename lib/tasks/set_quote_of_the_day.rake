desc "cron task to set the quote of the day"

task set_quote_of_the_day: :environment do
  begin
    Quote.set_quote_of_the_day!
  rescue => exception
    Rails.logger.error(exception)
  end
end
