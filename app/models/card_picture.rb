class CardPicture < ApplicationRecord
  has_one :card_block, as: :blockable, dependent: :destroy

  mount_uploader :picture, CardPictureUploader

  validates :alt, presence: true, length: { maximum: 100 }
  validates :picture, presence: true
end