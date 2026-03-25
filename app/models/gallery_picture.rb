class GalleryPicture < ApplicationRecord
  belongs_to :gallery, counter_cache: true
  mount_uploader :picture, GalleryPictureUploader

  validates :picture, presence: true
end
