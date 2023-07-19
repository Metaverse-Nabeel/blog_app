require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns http success and renders correct template and displays placeholder' do
      get '/users/1/posts'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('This is to show all the posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns http success and renders correct template and displays placeholder' do
      get '/users/1/posts/1'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('This is to show a specific the posts')
    end
  end
end
