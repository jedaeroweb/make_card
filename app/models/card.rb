class Card < ApplicationRecord
  belongs_to :user, counter_cache: true, optional: true
  has_many :card_blocks, -> { order(:position) }, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }
  validates :event_time, presence: true
  validate :event_time_must_be_tomorrow_or_later


  has_many :card_pictures,
           through: :card_blocks,
           source: :blockable,
           source_type: "CardPicture"

  has_many :galleries,
           through: :card_blocks,
           source: :blockable,
           source_type: "Gallery"

  has_many :notices,
           through: :card_blocks,
           source: :blockable,
           source_type: "Notice"

  has_many :maps,
           through: :card_blocks,
           source: :blockable,
           source_type: "Map"

  private

  def event_time_must_be_tomorrow_or_later
    return if event_time.blank?

    if event_time < Time.zone.tomorrow.beginning_of_day
      errors.add(:event_time, "내일 이후 날짜/시간만 선택할 수 있습니다.")
    end
  end
end
