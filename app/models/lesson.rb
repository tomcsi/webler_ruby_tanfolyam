class Lesson < ActiveRecord::Base
    has_many :presences
    has_many :users, through: :presences
    has_many :credits
    belongs_to :course

    validates :datum, :allapot, presence: true
end
