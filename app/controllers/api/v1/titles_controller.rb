class Api::V1::TitlesController < ApplicationController
  def index
    render json: Title.select(:show_id, :title, :show_type, :release_year, :country, :date_added, :description).order("release_year desc")
  end

  def create
    title = Title.new(title_params)

    if title.save
      render json: title, status: :created
    else
      render json: title.errors, status: :unprocessable_entity
    end

  end

  def destroy
    Title.find(params[:id]).destroy!

    head :no_content
  end

  def update
    Title.find(params[:id]).update_attributes(title_params)
    head :no_content
  end

  def import
    Title.import(params[:file])
    redirect_to root_url, notice: "Dados importados"
  end

  private

  def title_params
    params.require(:title).permit(:show_id, :title, :show_type, :release_year, :country, :listed_in, :description)
  end

end
