class AddCreditvalueToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :creditvalue, :integer
  end
end
