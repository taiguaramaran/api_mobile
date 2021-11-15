class PagesController < ApplicationController
  def home
    @titles = Title.select(:show_id, :title, :show_type, :release_year, :country, :date_added, :description)
    @str = '<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>'
    @array = @str.split('')
    @cont = 0
    @diamante = 0
    while @cont <= @array.length
      @array.delete('.')
      if (@array[@cont] == '<') && (@array[@cont + 1] == '>')
        @diamante += 1
        @array.delete_at(@cont)
        @array.delete_at(@cont)
        @cont = 0
      else
        @cont += 1
      end
    end
  end
end
