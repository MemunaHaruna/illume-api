class Api::BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy

  def index
    user = User.find(params.require(:user_id))
    bookmarks = user.bookmarks.page(params[:page]).per(params[:per_page] || 10)
    json_response(data: bookmarks, message: "Successfully fetched bookmarks")
  end

  def create
    bookmark = Bookmark
                .where(user_id: current_user.id, quote_id: params[:quote_id])
                .first_or_create!
    # bookmark = @current_user.bookmarks.new(bookmark_params)
    if bookmark
      json_response(data: bookmark, message: "Successfully created a bookmark")
    end
  rescue => error
    json_error_response(message: "Error creating bookmark", errors: error.message)
  end

  def destroy
    @bookmark.destroy
    json_basic_response(message: "Successfully deleted bookmark")
  end

  private

  def bookmark_params
    params.permit(:quote_id)
  end

  def set_bookmark
    @bookmark = @current_user.bookmarks.find(params.require(:id))
  end
end
