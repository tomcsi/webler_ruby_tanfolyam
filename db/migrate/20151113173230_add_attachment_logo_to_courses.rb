class AddAttachmentLogoToCourses < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :courses, :logo
  end
end
