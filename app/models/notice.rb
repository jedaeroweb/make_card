class Notice < ApplicationRecord
  has_rich_text :content
  has_one :card_block, as: :blockable, dependent: :destroy

  validates :title, presence: true
  validate :content_must_be_present

  validates :title_color,
            format: {
              with: /\A#(?:\h{3}|\h{6})\z/,
              message: "는 올바른 HTML 색상값이어야 합니다"
            },
            allow_blank: true

  validates :content_color,
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

  validates :content_size,
            numericality: {
              only_integer: true,
              greater_than: 0,
              message: "는 0보다 큰 숫자여야 합니다"
            },
            allow_blank: true

  validates :title_align,
            inclusion: { in: %w[left center right] },
            allow_blank: true

  validates :content_align,
            inclusion: { in: %w[left center right] },
            allow_blank: true

  private

  def content_must_be_present
    if content.blank? || content.body.blank?
      errors.add(:content, "를 입력해주세요")
    end
  end
end