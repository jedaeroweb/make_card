class GalleryPicturesController < ApplicationController
  before_action :set_gallery

  def create
    created_ids = []

    Array.wrap(params[:gallery_pictures]).each do |file|
      picture = @gallery.gallery_pictures.build(picture: file)

      if picture.save
        created_ids << picture.id
      else
        Rails.logger.debug "picture errors => #{picture.errors.full_messages.inspect}"
      end
    end

    @created_pictures = @gallery.gallery_pictures.where(id: created_ids)

    if @created_pictures.any?
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to edit_gallery_path(@gallery), notice: "이미지가 업로드되었습니다." }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "gallery_upload_errors",
            partial: "gallery_pictures/errors",
            locals: { message: "이미지 업로드에 실패했습니다." }
          ), status: :unprocessable_content
        end
        format.html { redirect_to edit_gallery_path(@gallery), alert: "이미지 업로드에 실패했습니다." }
      end
    end
  end

  def destroy
    @gallery_picture = @gallery.gallery_pictures.find(params[:id])
    @gallery_picture.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to edit_gallery_path(@gallery), notice: "이미지가 삭제되었습니다." }
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
end