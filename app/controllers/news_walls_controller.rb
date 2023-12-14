class NewsWallsController < InheritedResources::Base

  private

    def news_wall_params
      params.require(:news_wall)
    end

end
