class NewDetailsController < ApplicationController
  def show
    @new_details = NewsWall.find_by(id: params[:id])
  end
end
