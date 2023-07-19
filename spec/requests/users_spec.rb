require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success and renders correct template' do
      get '/users'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('This is to show all the usesrs')
    end
  end

  describe 'GET /users/:id' do
    it 'returns http success and renders correct template' do
      get '/users/1'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('This is to show a specific user')
    end
  end
end
