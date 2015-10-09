class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user
      t.date :date
      t.integer :amount
      t.string :type
      t.string :cardprovider
      t.timestamps null: false
    end
  end
end
