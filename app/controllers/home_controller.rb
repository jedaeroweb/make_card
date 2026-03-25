class HomeController < ApplicationController
  def index
    set_meta_tags canonical: root_url

    condition = { enable: true }

  end

  def feed

    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
  
  def no_auth

  end
end