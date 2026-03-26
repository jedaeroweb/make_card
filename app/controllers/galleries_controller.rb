class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i[show edit update destroy]

  def index
    @galleries = Gallery.order(created_at: :desc)
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @notice.save
      respond_to do |format|
        format.html { redirect_to notices_path, notice: "카드가 생성되었습니다." }
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
    if @gallery.update(gallery_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @gallery, notice: "저장되었습니다." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@gallery), partial: "form", locals: { gallery: @gallery }) }
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_path, notice: "카드가 삭제되었습니다." }
      format.turbo_stream
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title)
  end
end