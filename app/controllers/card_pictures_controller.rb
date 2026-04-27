class CardPicturesController < ApplicationController
  before_action :set_card
  before_action :set_card_picture, only: %i[update destroy]

  def create
    @card_picture = CardPicture.new(card_picture_params)

    if @card_picture.save
      @card.card_blocks.create!(
        blockable: @card_picture,
        position: next_position
      )

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to edit_card_path(@card), notice: "이미지가 업로드되었습니다." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :create, status: :unprocessable_content }
        format.html { render "cards/edit", status: :unprocessable_content }
      end
    end
  end

  def update
    if @card_picture.update(card_picture_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to edit_card_path(@card), notice: "이미지가 수정되었습니다." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :update, status: :unprocessable_content }
        format.html { render "cards/edit", status: :unprocessable_content }
      end
    end
  end

  def destroy
    @card.card_blocks.where(blockable: @card_picture).destroy_all
    @card_picture.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to new_card_path(@card), notice: "이미지가 삭제되었습니다." }
    end
  end

  private

  def set_card
    @card = Card.find(params[:card_id])
  end

  def set_card_picture
    @card_picture = @card.card_pictures.find(params[:id])
  end

  def card_picture_params
    params.require(:card_picture).permit(:alt, :picture, :enable)
  end

  def next_position
    (@card.card_blocks.maximum(:position) || 0) + 1
  end
end