class MapsController < ApplicationController
  before_action :set_map, only: %i[show edit update destroy]

  def search
    @card =Card.find(params[:card_id])
    render json: KakaoAddressService.search(@card.address)
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
  def index
    @map = Map.order(created_at: :desc)
  end

  def show
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)

    if @map.save
      respond_to do |format|
        format.html { redirect_to maps_path, notice: "카드가 생성되었습니다." }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :create, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @map = Map.find(params[:id])
    if @map.update(map_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @map, notice: "저장되었습니다." }
      end
    else
      respond_to do |format|
        format.html { render :edit }
      end
    end
  end

  def destroy
    @map.destroy

    respond_to do |format|
      format.html { redirect_to maps_path, notice: "카드가 삭제되었습니다." }
      format.turbo_stream
    end
  end

  private

  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:title, :title_size, :title_color, :title_align, :content, :content_size, :content_color, :content_align)
  end
end