class CardPicture < ApplicationRecord
  has_one :card_block, as: :blockable, dependent: :destroy
  mount_uploader :picture, CardPictureUploader
end
