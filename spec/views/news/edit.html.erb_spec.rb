require 'rails_helper'

RSpec.describe "news/edit", type: :view do
  let(:news) {
    News.create!()
  }

  before(:each) do
    assign(:news, news)
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(news), "post" do
    end
  end
end
