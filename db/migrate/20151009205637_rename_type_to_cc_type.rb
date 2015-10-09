class RenameTypeToCcType < ActiveRecord::Migration
  def change
    rename_column :payments, :type, :cctype
  end
end
