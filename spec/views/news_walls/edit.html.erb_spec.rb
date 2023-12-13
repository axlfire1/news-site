require 'rails_helper'

RSpec.describe "news_walls/edit", type: :view do
  let(:news_wall) {
    NewsWall.create!()
  }

  before(:each) do
    assign(:news_wall, news_wall)
  end

  it "renders the edit news_wall form" do
    render

    assert_select "form[action=?][method=?]", news_wall_path(news_wall), "post" do
    end
  end
end
