class HomeController < ApplicationController
  def index
    @news_wall = NewsWall.includes(:section).order(:created_at).page(params[:page])
    @announcements = Announcement.order(:created_at).page(params[:page])
  end
end
