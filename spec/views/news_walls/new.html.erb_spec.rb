require 'rails_helper'

RSpec.describe "news_walls/new", type: :view do
  before(:each) do
    assign(:news_wall, NewsWall.new())
  end

  it "renders new news_wall form" do
    render

    assert_select "form[action=?][method=?]", news_walls_path, "post" do
    end
  end
end
