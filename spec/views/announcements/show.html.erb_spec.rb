require 'rails_helper'

RSpec.describe "announcements/show", type: :view do
  before(:each) do
    assign(:announcement, Announcement.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
