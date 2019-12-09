class Api::QuotesController < ApplicationController
  # skip_before_action :authorize_api_request, only: [:index, :show]
  before_action :set_quote, only: [:update, :destroy]

  def index
    quotes = QuotesFinder.new(params: params, base_query: base_query).filter
    quotes = quotes.page(params[:page]).per(params[:per_page] || 10)
    json_response(status: :ok, data: quotes)
  end

  def show
    quote = base_query.find(params[:id])
    json_response(data: quote, message: "Successfully fetched a quote")
  end

  def personal_quotes
    quotes = QuotesFinder.new(params: params, base_query: @current_user.quotes).filter
    quotes = quotes.page(params[:page]).per(params[:per_page] || 10)
    json_response(data: quotes, message: "Successfully fetched personal quotes")
  end

  def create
    new_quote = @current_user.quotes.create! quote_params
    json_response(data: new_quote, message: "Successfully created a new quote")
  rescue => error
    json_error_response(message: "Error while creating a quote", errors: error.message)
  end

  def update
    if @quote.update quote_params
      json_response(data: @quote, message: "Successfully updated a quote")
    else
      json_error_response(message: "Error while updating a quote", errors: @quote.errors.full_messages)
    end
  end

  def destroy
    @quote.destroy
    json_basic_response(message: "Successfully deleted a quote")
  end

  def qotd
    quote_of_the_day = Quote.find_by(is_qotd: true)
    if quote_of_the_day
      json_response(data: quote_of_the_day, message: "Successfully fetched quote of the day")
    else
      json_basic_response(message: "Oops, looks like there is a problem. Please, try again")
    end
  end

  private

  def quote_params
    params.permit(:content, :author, :source_type, :source_title, :link_to_source, :access)
  end

  def set_quote
    @quote = @current_user.quotes.find(params[:id])
  end

  def base_query
    Quote.includes(:tags, :user).visible_to(@current_user)
  end
end
