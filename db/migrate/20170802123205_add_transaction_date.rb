class AddTransactionDate < ActiveRecord::Migration[5.0]
  def change
     add_column :plannedtransactions, :date, :date
  end
end
