class AddExpenseAndIncomeTypeToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :expense, :boolean
    add_column :categories, :income, :boolean
  end
end
