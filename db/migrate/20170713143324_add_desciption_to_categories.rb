class AddDesciptionToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :desciption, :string
  end
end
