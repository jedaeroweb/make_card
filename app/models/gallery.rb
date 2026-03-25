class Gallery < ApplicationRecord
  has_one :card_block, as: :blockable, dependent: :destroy

  has_many :gallery_pictures, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
end
