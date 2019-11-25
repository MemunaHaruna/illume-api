class QuotesController < ApplicationController
  def index
    quotes = QuotesFinder.new(params, @current_user).filter.recent_first
    quotes = quotes.page(params[:page]).per(params[:per_page] || 10)
    json_response(status: :ok, data: quotes)
  end

  def qotd
    quote_of_the_day = Quote.find_by(is_qotd: true)
    if quote_of_the_day
      json_response(data: quote_of_the_day, message: "Successfully fetched quote of the day")
    else
      json_basic_response(message: "Oops, looks like there is a problem. Please, try again")
    end
  end
end
