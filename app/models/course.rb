class Course < ActiveRecord::Base
    has_many :lessons
    has_attached_file :logo, 
        styles: {
            thumb: "100x100>" 
        }, 
        default_url: "/logo/:style/missing.png",
        url: "/logo/:hash.:extension",
        hash_secret: "longSecretString"

    validates :name, presence: true
    validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
