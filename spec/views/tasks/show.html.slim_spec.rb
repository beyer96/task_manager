require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @task = create(:task, user:)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Task 1/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
  end
end