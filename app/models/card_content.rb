class CardContent < ApplicationRecord
    belongs_to :card, counter_cache: true
    validates_presence_of :content
end
