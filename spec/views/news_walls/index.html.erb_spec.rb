require 'rails_helper'

RSpec.describe "news_walls/index", type: :view do
  before(:each) do
    assign(:news_walls, [
      NewsWall.create!(),
      NewsWall.create!()
    ])
  end

  it "renders a list of news_walls" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
