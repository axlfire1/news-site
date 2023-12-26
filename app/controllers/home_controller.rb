class HomeController < ApplicationController
  def index
    @sections = Section.all.pluck(:id, :name)
    @news_wall = NewsWall.includes(:section).order(:created_at).page(params[:page])
    @announcements = Announcement.order(:created_at).page(params[:page])
  end
end
