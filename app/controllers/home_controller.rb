class HomeController < ApplicationController
  def index
    set_meta_tags canonical: root_url

    condition = { enable: true }


    @question_categories= QuestionCategory.where(enable: true)

    @galleries = Gallery.page(0).per(6).order('id desc')


    @blog_count = Blog.where(condition).count
    @blogs = Blog.where(condition).page(0).per(6).order('id desc')

    @talk_count = Talk.where(condition).count
    @talks = Talk.where(condition).page(0).per(6).order('id desc')
  end

  def feed
    @blogs = Blog.where(:enable=>true).order(id: :desc).limit(50)
    @questions = Question.where(:enable=>true).order(id: :desc).limit(50)
    @talks = Talk.where(:enable=>true).order(id: :desc).limit(50)

    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
  
  def no_auth

  end
end