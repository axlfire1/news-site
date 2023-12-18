class HomeController < ApplicationController
  def index
    @news_wall = NewsWall.order(:created_at).page(params[:page])
  end
end
