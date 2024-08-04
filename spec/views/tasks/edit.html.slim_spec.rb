require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  let(:user) { create(:user) }
  let(:project) { create(:project, user:) }
  let(:task) { create(:task, user:, project:) }

  before(:each) do
    assign(:task, task)
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(task), "post" do

      assert_select "input[name=?]", "task[title]"

      assert_select "textarea[name=?]", "task[description]"

      assert_select "input[name=?]", "task[is_done]"

      assert_select "input[name=?]", "task[attachment]"
    end
  end
end
