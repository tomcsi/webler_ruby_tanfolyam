class DateValidator < ActiveModel::Validator
    def validate(record)
        record.errors[:birthdate] << "not valid" if Date.parse(record.birthdate.to_s).year < 1900
    end
end

class User < ActiveRecord::Base
    has_many :presences, dependent: :destroy
    has_many :lessons, through: :presences
    has_many :payments, dependent: :destroy
    has_many :credits, dependent: :destroy

    validates :firstname, :lastname, :birthdate, presence: true
    validates :birthdate, format: { with: /\A[0-9]{4}.[0-9]{2}.[0-9]{2}.?\z/ }
    validates_with DateValidator

    def name
      self.firstname + " " + self.lastname
    end

    def lessoncount
        self.lessons.count
    end

    def credit
        credit = 0
        self.credits.each do |c|
            credit += c.credit
        end
        return credit
    end
end
