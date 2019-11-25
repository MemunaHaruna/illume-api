desc "cron task to notify users of the current quote of the day"

task set_quote_of_the_day: :environment do
  begin
    # User.send_qotd_notification!
  rescue => exception
    Rails.logger.error(exception)
  end
end
