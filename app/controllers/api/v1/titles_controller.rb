class Api::V1::TitlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index

    render json: Title.select(:show_id, :title, :show_type, :release_year, :country,
                              :date_added, :description).where(request.query_parameters).order('release_year asc')

  end

  def create
    title = Title.new(title_params)
    if title.save
      render json: title, status: :created
    else
      puts " XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
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
    ::TitlesImporter.call!(params[:file])
    #redirect_to titles_path, notice: 'Dados importados'
    render json: Title.all
  end

  private

  def title_params
    params.require(:title).permit(:show_id, :title, :show_type, :release_year, :country, :listed_in, :description)
  end
end
