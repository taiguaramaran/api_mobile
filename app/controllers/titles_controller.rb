class TitlesController < ApplicationController
  def index
    @titles = Title.all
  end

  def create
    @title = Title.new(title_params)

    if @title.save
      redirect_to :index
    else
      render :new, errors: @title.errors
    end

  end

  def destroy
    @title = Title.find(params[:id])
    if @title.destroy
      redirect_to :index
    else
      redirect_to :index, errors: @title.errors
    end

  end

  def update
    @title = Title.find(params[:id])
    if @title.update_attributes(title_params)
      redirect_to :index
    else
      redirect_to :edit, errors: @title.errors
    end

  end

  def edit
    @title = Title.find(params[:id])

  end

  def import
    ::TitlesImporter.call!(params[:file])
    redirect_to titles_path, notice: "Dados importados"
  end

  private

  def title_params
    params.require(:title).permit(:show_id, :title, :show_type, :release_year, :country, :listed_in, :description)
  end

end
