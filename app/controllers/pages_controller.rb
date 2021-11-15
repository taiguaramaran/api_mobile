class PagesController < ApplicationController
  def home
    @array = '<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>'.split('')
    @cont = 0
    @diamante = 0
    @array.delete('.')
    while @cont <= @array.length
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
