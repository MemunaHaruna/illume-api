class QuotesController < ApplicationController
  def index
    quotes = Quote.includes(:tags, :user).visible(@current_user)
    quotes = quotes.page(params[:page]).per(params[:per_page] || 10)
    json_response(status: :ok, data: quotes)
  end
end
