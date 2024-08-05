require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:tags, create_list(:tag, 2, user:))
  end

  it "renders a list of tags" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("My tag".to_s), count: 2
  end
end
