class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :user
      t.references :lesson
      t.timestamps null: false
    end
  end
end
