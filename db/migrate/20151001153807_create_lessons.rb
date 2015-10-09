class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.date :datum
      t.text :allapot
      t.timestamps null: false
    end
  end
end
