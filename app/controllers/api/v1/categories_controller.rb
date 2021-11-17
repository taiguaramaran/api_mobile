class Api::V1::CategoriesController < ApplicationController
  def index
    render json: Title.select(:id, :title).order('published_at asc')
  end

  def show
    render json: params[:id]
  end

end
