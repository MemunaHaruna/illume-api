desc "cron task to set the quote of the day"

task set_quote_of_the_day: :environment do
  begin
    puts 'started setting quote of the day'
    Quote.set_quote_of_the_day!
    puts 'finished setting quote of the day'
  rescue => exception
    Rails.logger.error(exception)
  end
end
