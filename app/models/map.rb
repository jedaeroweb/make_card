class Map < ApplicationRecord
  has_one :card_block, as: :blockable, dependent: :destroy
end
