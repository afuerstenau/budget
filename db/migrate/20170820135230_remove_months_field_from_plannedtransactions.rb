class RemoveMonthsFieldFromPlannedtransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :plannedtransactions, :months
  end
end
