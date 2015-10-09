class Presence < ActiveRecord::Base
    belongs_to :user
    belongs_to :lesson

    validates :user_id, :lesson_id, presence: true

    after_save do |presence|
        c = Credit.new
        c.user_id = self.user_id
        c.lesson_id = self.lesson_id
        c.date = Date.parse(Time.now.to_s).to_s
        c.credit = self.lesson.creditvalue
        c.save
    end
    
end
