require 'rails_helper'
require 'ffi'

RSpec.describe User, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                           posts_counter: 0)

  first_post = Post.new(user: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                        likes_counter: 3)
  second_post = Post.new(user: first_user, title: 'Hello', text: 'This is my second post', comments_counter: 2,
                         likes_counter: 3)
  third_post = Post.new(user: first_user, title: 'Hello', text: 'This is my third post', comments_counter: 2,
                        likes_counter: 3)
  fourth_post = Post.new(user: first_user, title: 'Hello', text: 'This is my fourth post', comments_counter: 2,
                         likes_counter: 3)

  context 'Write validation tests for User Model' do
    it 'is not valid without a name' do
      first_user.name = nil
      expect(first_user).to_not be_valid
    end

    it 'is valid with a name' do
      first_user.name = 'Sahar'
      expect(first_user).to be_valid
    end

    it 'is not valid if posts_counter is not integer' do
      first_user.posts_counter = 'Balitaan'
      expect(first_user).to_not be_valid
    end

    it 'is not valid if posts_counter is negative' do
      first_user.posts_counter = -21
      expect(first_user).to_not be_valid
    end
  end

  context 'Write unit tests for User Model Methods' do
    it 'returns 0 for no post' do
      number_of_posts = first_user.recent_3_posts.count
      expect(number_of_posts).to be 0
    end

    it 'returns 1 for one post' do
      first_post.save
      number_of_posts = first_user.recent_3_posts.count
      expect(number_of_posts).to be 1
    end

    it 'returns 3 for three post' do
      second_post.save
      third_post.save
      fourth_post.save
      posts = first_user.recent_3_posts
      number_of_posts = first_user.recent_3_posts.count
      texts = posts.pluck(:text)
      expect(number_of_posts).to be 3
      expect(texts).to eql [fourth_post.text, third_post.text, second_post.text]
    end
  end
end
