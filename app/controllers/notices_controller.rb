class NoticesController < ApplicationController
  before_action :set_notice, only: %i[show edit update destroy]

  def index
    @notices = Notice.order(created_at: :desc)
  end

  def show
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)

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
    @notice = Notice.find(params[:id])
    if @notice.update(notice_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @notice, notice: "저장되었습니다." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :update, status: :unprocessable_content }
        format.html { render "cards/edit", status: :unprocessable_content }
      end
    end
  end

  def destroy
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to notices_path, notice: "카드가 삭제되었습니다." }
      format.turbo_stream
    end
  end

  private

  def set_notice
    @notice = Notice.find(params[:id])
  end

  def notice_params
    params.require(:notice).permit(:title, :title_size, :title_color, :title_align, :content, :content_size, :content_color, :content_align)
  end
end