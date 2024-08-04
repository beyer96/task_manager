require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:projects, create_list(:project, 2, user:))
  end

  it "renders a list of projects" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Project".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(1.to_s), count: 2
  end
end
