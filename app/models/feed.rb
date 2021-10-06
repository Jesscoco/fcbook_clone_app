class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :comment, presence: true, length: { minimum: 4}
  belongs_to :user 
end
