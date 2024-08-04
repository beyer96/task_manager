require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  let(:user) { create(:user) }
  let(:project) { create(:project, user:) }

  before(:each) do
    @tasks = create_list(:task, 2, user:, project:)
  end

  it "renders a list of tasks" do
    render

    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Task 1"), count: 2
    assert_select cell_selector, text: Regexp.new("Description"), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
