require "rails_helper"

RSpec.describe NewsWallsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/news_walls").to route_to("news_walls#index")
    end

    it "routes to #new" do
      expect(get: "/news_walls/new").to route_to("news_walls#new")
    end

    it "routes to #show" do
      expect(get: "/news_walls/1").to route_to("news_walls#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/news_walls/1/edit").to route_to("news_walls#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/news_walls").to route_to("news_walls#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/news_walls/1").to route_to("news_walls#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/news_walls/1").to route_to("news_walls#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/news_walls/1").to route_to("news_walls#destroy", id: "1")
    end
  end
end
