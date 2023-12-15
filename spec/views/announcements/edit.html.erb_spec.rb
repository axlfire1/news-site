require 'rails_helper'

RSpec.describe "announcements/edit", type: :view do
  let(:announcement) {
    Announcement.create!()
  }

  before(:each) do
    assign(:announcement, announcement)
  end

  it "renders the edit announcement form" do
    render

    assert_select "form[action=?][method=?]", announcement_path(announcement), "post" do
    end
  end
end
