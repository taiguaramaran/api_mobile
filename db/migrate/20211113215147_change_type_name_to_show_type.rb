class ChangeTypeNameToShowType < ActiveRecord::Migration[6.0]
  def change
    rename_column :titles, :type, :show_type
  end
end
