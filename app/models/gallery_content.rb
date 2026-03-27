class GalleryContent < ApplicationRecord
  belongs_to :gallery, counter_cache: true
  validates_presence_of :content
end
