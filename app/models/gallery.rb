class Gallery < ApplicationRecord
  has_one :card_block, as: :blockable, dependent: :destroy

  has_many :gallery_pictures, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }

  validates :title_color,
            format: {
              with: /\A#(?:\h{3}|\h{6})\z/,
              message: "는 올바른 HTML 색상값이어야 합니다"
            },
            allow_blank: true

  validates :title_size,
            numericality: {
              only_integer: true,
              greater_than: 0,
              message: "는 0보다 큰 숫자여야 합니다"
            },
            allow_blank: true

  validates :title_align,
            inclusion: { in: %w[left center right] },
            allow_blank: true
end
