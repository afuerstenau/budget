class RenameActivitiesToPlannedTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_table :plannedtransaction, :plannedtransactions
  end
end
