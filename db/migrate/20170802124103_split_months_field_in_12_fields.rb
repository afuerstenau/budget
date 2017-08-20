class SplitMonthsFieldIn12Fields < ActiveRecord::Migration[5.0]
  def change
    add_column :plannedtransactions, :january, :boolean
    add_column :plannedtransactions, :february, :boolean
    add_column :plannedtransactions, :march, :boolean
    add_column :plannedtransactions, :april, :boolean
    add_column :plannedtransactions, :may, :boolean
    add_column :plannedtransactions, :june, :boolean
    add_column :plannedtransactions, :july, :boolean
    add_column :plannedtransactions, :august, :boolean
    add_column :plannedtransactions, :september, :boolean
    add_column :plannedtransactions, :october, :boolean
    add_column :plannedtransactions, :november, :boolean
    add_column :plannedtransactions, :december, :boolean
  end
end
