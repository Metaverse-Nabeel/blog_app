require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /posts" do
    it "returns http success" do
      get "/users/posts"
      expect(response).to have_http_status(:success)
    end
  end

end
