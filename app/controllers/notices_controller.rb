class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  def index
    @cards = Card.order(created_at: :desc)
  end

  def show
  end

  def new
    @card = Card.new

    @gallery = Gallery.new
    @notice = Notice.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to @card, notice: "카드가 생성되었습니다."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
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

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :address, :event_time)
  end
end