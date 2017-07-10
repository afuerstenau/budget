class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :moneymoney_id
      t.date :occurance_date
      t.date :value_date
      t.references :category
      t.string :name
      t.string :purpose
      t.string :account
      t.string :bank
      t.decimal :amount
      t.string :currency

      t.timestamps
    end
  end
end
