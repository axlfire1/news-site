require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  let(:section) {
    Section.create!()
  }

  before(:each) do
    assign(:section, section)
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(section), "post" do
    end
  end
end
