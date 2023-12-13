require 'rails_helper'

RSpec.describe "news_walls/show", type: :view do
  before(:each) do
    assign(:news_wall, NewsWall.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
