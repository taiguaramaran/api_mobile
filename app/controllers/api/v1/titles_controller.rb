class Api::V1::TitlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Title.select(:id, :title, :genre, :published_at, :country,
                              :date_added, :description).where(request.query_parameters).order('published_at asc')
  end

  def index_blocked
    render json: Title.select(:id, :title, :genre, :published_at, :country,
                              :date_added, :description).where(title: 'A Clockwork Orange')
  end


  def title_name
    nome = params[:title]
    render json: { data: nome }
  end



  def create
    title = Title.new(title_params)
    if title.save
      render json: { status: 'SUCCESS', message: 'Created', data: title }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Not Created' }, status: :unprocessable_entity
    end
  end

  def show
    title = Title.find_by_id(params[:id])
    if !title.nil?
      render json: { status: 'SUCCESS', message: 'Showed', data: title }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Not Showed' }, status: :unprocessable_entity
    end
  end



  def destroy
    title = Title.find_by_id(params[:id])
    if !title.nil?
      Title.find(params[:id]).destroy!
      render json: { status: 'SUCCESS', message: 'Deleted', data: title }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Not Deleted' }, status: :unprocessable_entity
    end
  end

  def update
    title = Title.find(params[:id])
	  if title.update_attributes(title_params)
			render json: { status: 'SUCCESS', message: 'Updated', data: title },status: :ok
		else
			render json: { status: 'ERROR', message: 'Not update' }, status: :unprocessable_entity
		end
  end

  def import
    if !params[:file].nil?
      ::TitlesImporter.call!(params[:file])
      render json: { status: 'SUCCESS', message: 'Imported' }, status: :ok
      # render json: Title.select(:id, :title, :genre, :published_at, :country,
                              #:date_added, :description).order('release_year asc')
    else
      render json: { status: 'ERROR', message: 'Not imported' }, status: :unprocessable_entity
    end
  end

  private

  def title_params
    params.permit(:show_id, :title, :genre, :published_at, :country, :listed_in, :description)
  end
end
