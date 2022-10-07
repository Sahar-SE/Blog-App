require 'rails_helper'

RSpec.describe Post, type: :model do
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.', postsCounter: 0)

  first_post = Post.create(user: second_user, title: 'Hello', text: 'This is my first post', commentsCounter: 2,
                           likesCounter: 3)

  first_comment = Comment.new(post: first_post, user: second_user, text: 'Hi Tom!')
  second_comment = Comment.new(post: first_post, user: second_user, text: 'Hi Tom!')
  third_comment = Comment.new(post: first_post, user: second_user, text: 'Hi Tom!')
  fourth_comment = Comment.new(post: first_post, user: second_user, text: 'Hi Tom!')
  fifth_comment = Comment.new(post: first_post, user: second_user, text: 'Hi Tom!')
  sixth_comment = Comment.new(post: first_post, user: second_user, text: 'Hi Tom!')

  context 'Write validation tests for Post Model' do
    it 'is not valid without a title' do
      first_post.title = nil
      expect(first_post).to_not be_valid
    end

    it 'is not valid if title exceed 250 characters' do
      first_post.title = 'M' * 251
      expect(first_post).to_not be_valid
    end

    it 'is valid with a name' do
      first_post.text = 'This is the content of the post.'
      expect(first_post).to_not be_valid
    end

    it 'is not valid if comments_counter is not integer' do
      first_post.commentsCounter = 'Mavericks'
      expect(first_post).to_not be_valid
    end

    it 'is not valid if comments_counter is negative' do
      first_post.commentsCounter = -5
      expect(first_post).to_not be_valid
    end

    it 'is not valid if likes_counter is not an integer' do
      first_post.likesCounter = 'Balitaan'
      expect(first_post).to_not be_valid
    end

    it 'is not valid if likes_counter is negative' do
      first_post.likesCounter = -21
      expect(first_post).to_not be_valid
    end
  end

  context 'Write unit tests for Post Model Methods' do
    it 'returns 0 for no comment' do
      number_of_comments = first_post.recent_5_comments.count
      expect(number_of_comments).to be 0
    end

    it 'returns 1 for one comment' do
      first_comment.save
      number_of_comments = first_post.recent_5_comments.count
      expect(number_of_comments).to be 1
    end

    it 'returns 5 for five comments' do
      second_comment.save
      third_comment.save
      fourth_comment.save
      fifth_comment.save
      sixth_comment.save

      comments = first_post.recent_5_comments
      number_of_comments = first_post.recent_5_comments.count
      texts = comments.pluck(:text)
      expect(number_of_comments).to be 5
      expect(texts).to eql [sixth_comment.text, fifth_comment.text, fourth_comment.text, third_comment.text,
                            second_comment.text]
    end
  end

  context 'Write unit tests for Post Model Methods' do
    it 'updates post counter equal to 1 for a given user' do
      first_post.update_post_counter
      number_of_posts = second_user.postsCounter
      expect(number_of_posts).to eq 2
    end

    it 'updates post counter equal to 2 for a given user' do
      first_post.update_post_counter
      second_post = Post.create(user: second_user, title: 'Hello', text: 'This is my second post', commentsCounter: 2,
                                likesCounter: 3)
      second_post.update_post_counter
      number_of_posts = second_user.postsCounter
      expect(number_of_posts).to eq 5
    end
  end
end
