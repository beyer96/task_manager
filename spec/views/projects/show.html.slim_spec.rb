require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:project, create(:project, user:))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Project/)
    expect(rendered).to match(/1/)
  end
end
