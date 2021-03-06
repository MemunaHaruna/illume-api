class Api::HomeController < ApplicationController
  skip_before_action :authorize_api_request, only: :index

  def index
    quotes = QuotesFinder.new(params: params, base_query: base_query).filter
    quotes = quotes.page(params[:page]).per(params[:per_page] || 15)
    json_response(status: :ok, data: quotes, message: "Welcome to Illume API!")
  end

  private

  def base_query
    Quote.includes(:tags, :user).where(access: 0)
  end
end
