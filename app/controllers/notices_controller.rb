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
    if @notice.update(notice_params)
      respond_to do |format|
        format.html { redirect_to notices_path, notice: "카드가 수정되었습니다." }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :update, status: :unprocessable_entity }
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
    params.require(:notice).permit(:title, :content)
  end
end