class RenamePlannedTransactionsWithoutUnderscore < ActiveRecord::Migration[5.0]
  def change
    rename_table :plannedtransactions, :plannedtransactions
  end
end
