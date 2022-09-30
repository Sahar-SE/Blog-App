require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /show' do
    before(:example) { get '/users/:user_id/posts/:id' }

    it 'returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'returns correct response body' do
      expect(response.body).to include('Post of the user')
    end
  end

  describe 'GET /index' do
    before(:example) { get '/users/:user_id/posts' }

    it 'returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'returns correct response body' do
      expect(response.body).to include('List of all posts')
    end
  end
end
