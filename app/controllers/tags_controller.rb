class TagsController < ApplicationController
  def index
    tags = Tag.filter_by_name(params[:query] || '')
    tags = tags.page(params[:page]).per(params[:per_page] || 50)
    json_response(status: :ok, data: tags)
  end

  def create
    tags = Tag.filter_by_name(params.require(:name))
    if tags.any?
      tags = tags.page(params[:page]).per(params[:per_page] || 50)
      json_response(status: :ok, data: tags, message: "Tag already exists")
    else
      tag = Tag.create! create_params
      return json_response(data: tag, message: "Successfully created a tag")
    end
  end

  private

  def create_params
    params.permit(:name)
  end
end
