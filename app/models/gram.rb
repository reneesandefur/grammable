class Gram < ApplicationRecord
    validates :message, presence: true, length: { maximum: 140, minimum: 3 }
    mount_uploader :image, ImageUploader
    belongs_to :user
end
