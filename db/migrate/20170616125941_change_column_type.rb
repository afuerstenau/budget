class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :activities, :amount, :decimal, :precision => 8, :scale => 2
  end
end
