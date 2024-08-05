require 'rails_helper'

RSpec.describe "tags/new", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
    assign(:tag, build(:tag))
  end

  it "renders new tag form" do
    render

    assert_select "form[action=?][method=?]", tags_path, "post" do

      assert_select "input[name=?]", "tag[title]"

      assert_select "select[name=?]", "tag[user_id]"
    end
  end
end
