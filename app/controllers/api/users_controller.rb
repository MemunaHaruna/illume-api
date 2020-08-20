class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :quotes]

  def show
    token = Auth::AuthenticateUser.new(@user.id).call
    json_auth_response(token: token,
      user: UserSerializer.new(@user),
      message: "Successfully fetched User"
    )
  end

  def quotes
    quotes_list = QuotesFinder.new(params: params, base_query: base_query).filter
    quotes_list = quotes_list.page(params[:page]).per(params[:per_page] || 10)
    json_response(data: quotes_list, current_user: @current_user,
      message: "Successfully fetched quotes for User")
  end

  private

  def set_user
    @user = User.find(params.require(:id))
  end

  def base_query
    @user.quotes.visible_to(@current_user)
  end
end
