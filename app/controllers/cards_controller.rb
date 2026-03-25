class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  def index
    @cards = Card.order(created_at: :desc)
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to edit_card_path(@card), notice: "카드가 생성되었습니다."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @card = Card.find(params[:id])

    @gallery = @card.galleries.first || create_gallery_block_for(@card)
    @notice  = @card.notices.first  || create_notice_block_for(@card)
  end

  def update
    if @card.update(card_params)
      redirect_to @card, notice: "카드가 수정되었습니다."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: "카드가 삭제되었습니다."
  end

  private

  def create_gallery_block_for(card)
    gallery = Gallery.create!(title: "갤러리")
    card.card_blocks.create!(
      blockable: gallery,
      position: next_position(card)
    )
    gallery
  end

  def create_notice_block_for(card)
    notice = Notice.create!(title: "우리 결혼해요", content: "축하해주세요")
    card.card_blocks.create!(
      blockable: notice,
      position: next_position(card)
    )
    notice
  end

  def next_position(card)
    (card.card_blocks.maximum(:position) || 0) + 1
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :address, :event_time)
  end
end