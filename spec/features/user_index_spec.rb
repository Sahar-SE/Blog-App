require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  before(:each) do
    visit root_path
  end

  it 'shows the username of the users' do
    expect(page).to have_content('Tom')
  end

  it 'shows the photos of the users' do
    expect(page.html).to include('user-photo')
  end

  it 'shows the number of post of each user' do
    user = User.last
    expect(page).to have_content("Number of posts: #{user.postsCounter}")
  end
end
