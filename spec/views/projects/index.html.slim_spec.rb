require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  let(:user) { create(:user) }
  let(:projects) {
    create_list(:project, 2, user:) do |project, index|
      project.position = index + 100
      project.save!
    end
  }
  before(:each) do
    assign(:projects, projects)
  end

  it "renders a list of projects" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Project".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(100.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(101.to_s), count: 1
  end
end
