require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
    @post = Post.create(user: @user, title: 'title', text: 'text')
  end

  describe 'GET index' do
    it 'renders index' do
      get :index, params: { user_id: @user.id }
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  # describe 'GET show' do
  #   get :show, params: { id: @posts, user_id: @user }
  #   expect(response.status).to eq(200)
  #   expect(response).to render_template('show')
  # end
end
