class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :desciption, :description
  end
end
