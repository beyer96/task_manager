require 'rails_helper'

RSpec.describe "tags/edit", type: :view do
  let(:user) { create(:user) }
  let(:tag) { create(:tag, user:) }

  before(:each) do
    sign_in user
    assign(:tag, tag)
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(tag), "post" do

      assert_select "input[name=?]", "tag[title]"

      assert_select "select[name=?]", "tag[user_id]"
    end
  end
end
