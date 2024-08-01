require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe "GET #index" do
    it "returns OK status" do
      get "/"

      expect(response.status).to eq(200)
    end
  end
end
