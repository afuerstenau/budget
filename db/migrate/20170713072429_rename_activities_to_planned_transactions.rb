class RenameActivitiesToPlannedTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_table :activities, :plannedtransactions
  end
end
