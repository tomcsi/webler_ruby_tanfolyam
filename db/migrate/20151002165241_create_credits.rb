class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :user
      t.references :lesson
      t.date :date
      t.integer :credit
      t.timestamps null: false
    end
  end
end
