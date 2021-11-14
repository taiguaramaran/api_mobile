class PagesController < ApplicationController
  def home
    @titles = Title.select(:show_id, :title, :show_type, :release_year, :country, :date_added, :description)
  end

end
