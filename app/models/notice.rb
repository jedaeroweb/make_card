class Notice < ApplicationRecord
  has_one :card_block, as: :blockable, dependent: :destroy
  validates_presence_of :title,:content
end
