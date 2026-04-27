class CardBlock < ApplicationRecord
    belongs_to :card, optional: true
    belongs_to :blockable, polymorphic: true

    after_create :update_card_counters_on_create
    after_destroy :update_card_counters_on_destroy

    private

    def update_card_counters_on_create
        return unless card.present?

        case blockable_type
        when "Notice"
            card.class.where(id: card.id)
                .update_all("notices_count = (SELECT COUNT(*) FROM card_blocks WHERE card_id = #{card.id} AND blockable_type = 'Notice')")
        when "Gallery"
            card.class.where(id: card.id)
                .update_all("galleries_count = (SELECT COUNT(*) FROM card_blocks WHERE card_id = #{card.id} AND blockable_type = 'Gallery')")
        when "Picture"
        card.class.where(id: card.id)
            .update_all("card_pictures_count = (SELECT COUNT(*) FROM card_blocks WHERE card_id = #{card.id} AND blockable_type = 'Picture')")
        when "Map"
            card.class.where(id: card.id)
                .update_all("maps_count = (SELECT COUNT(*) FROM card_blocks WHERE card_id = #{card.id} AND blockable_type = 'Map')")
        end

    end

    def update_card_counters_on_destroy
        update_card_counters_on_create # 삭제 후에도 동일하게 갱신
    end
end
