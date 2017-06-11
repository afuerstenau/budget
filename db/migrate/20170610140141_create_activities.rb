class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :amount
      t.string :months
      t.boolean :repeat_yearly
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
