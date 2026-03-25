class CardBlock < ApplicationRecord
    belongs_to :card, counter_cache: true
    belongs_to :blockable, polymorphic: true, dependent: :destroy
end
