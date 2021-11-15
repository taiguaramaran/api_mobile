class ChangeFieldsNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :titles, :show_type, :genre
    rename_column :titles, :release_year, :published_at
  end
end
