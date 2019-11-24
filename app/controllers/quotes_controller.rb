class QuotesController < ApplicationController
  def index
    quotes = QuotesFinder.new(params, @current_user).filter
    quotes = quotes.page(params[:page]).per(params[:per_page] || 10)
    json_response(status: :ok, data: quotes)
  end
end
