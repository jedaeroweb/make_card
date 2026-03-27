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

    @notice  = @card.notices.first  || create_notice_block_for(@card)
    @gallery = @card.galleries.first || create_gallery_block_for(@card)
    @map = @card.maps.first || build_map_block_for(@card)
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
    raw_text = <<~TEXT

    저희가 오늘에 있기까지 보내주신
    따뜻한 사랑에 진심으로 감사드립니다.

    저희 두 사람은 여러분의 축복을 받으며
    진실한 가약을 맺고자 합니다.

    부디 참석하시어 기쁨의 자리를 축복으로
    더욱 빛내 주시길 바랍니다.
  TEXT

    content_html = ApplicationController.helpers.simple_format(raw_text)

    notice = Notice.create!(
      title: "초대합니다",
      content: content_html,
      title_color: "#333333",
      content_color: "#333333"
    )

    card.card_blocks.create!(
      blockable: notice,
      position: next_position(card)
    )
    notice
  end

  def build_map_block_for(card)
    map = card.maps.build(
      title: '오시는 길'
    )

    card.card_blocks.build(
      blockable: map,
      position: next_position(card)
    )

    map
  end

  def next_position(card)
    (card.card_blocks.maximum(:position) || 0) + 1
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :place, :zipcode, :address, :address_detail, :event_time)
  end
end