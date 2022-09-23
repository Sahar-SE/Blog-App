require 'rails_helper'

RSpec.describe Like, type: :model do
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.', posts_counter: 0)

  first_post = Post.create(user: second_user, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                           likes_counter: 3)

  first_like = Like.create(post: first_post, user: second_user)

  context 'Write unit tests for Like Model Methods' do
    it 'updates like counter equal to 1 for a given post' do
      first_like.update_likes_counter
      number_of_likes = first_post.likes_counter
      expect(number_of_likes).to be 1
    end

    it 'updates like counter equal to 2 for a given post' do
      first_like.update_likes_counter
      second_like = Like.create(post: first_post, user: second_user)
      second_like.update_likes_counter
      number_of_likes = first_post.likes_counter
      expect(number_of_likes).to be 2
    end
  end
end
