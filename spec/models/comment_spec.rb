require 'rails_helper'

RSpec.describe Comment, type: :model do
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.', posts_counter: 0)

  first_post = Post.create(user: second_user, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                           likes_counter: 3)

  first_comment = Comment.create(post: first_post, user: second_user, text: 'Hi Tom!')

  context 'Write unit tests for Comment Model Methods' do
    it 'updates comment counter equal to 1 for a given post' do
      first_comment.update_comments_counter
      number_of_comments = first_post.comments_counter
      expect(number_of_comments).to be 1
    end

    it 'updates comment counter equal to 2 for a given post' do
      first_comment.update_comments_counter
      second_comment = Comment.create(post: first_post, user: second_user, text: 'Hi Tom!')
      second_comment.update_comments_counter
      number_of_comments = first_post.comments_counter
      expect(number_of_comments).to be 2
    end
  end
end
