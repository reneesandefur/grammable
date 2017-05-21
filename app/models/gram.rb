class Gram < ApplicationRecord
    validates :message, presence: true, length: { maximum: 140, minimum: 3 }
    validates :image, presence: true
    
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :comments
end
