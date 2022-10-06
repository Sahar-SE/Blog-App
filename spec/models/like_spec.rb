# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#                             bio: 'Teacher from Poland.', postsCounter: 0)

#   first_post = Post.create(user: second_user, title: 'Hello', text: 'This is my first post', commentsCounter: 2,
#                            likesCounter: 3)

#   first_like = Like.create(post: first_post, user: second_user)

#   context 'Write unit tests for Like Model Methods' do
#     it 'updates like counter equal to 1 for a given post' do

#       number_of_likes = first_post.likesCounter
#       expect(number_of_likes).to eq 4
#     end

#     it 'updates like counter equal to 2 for a given post' do

#       second_like = Like.create(post: first_post, user: second_user)

#       number_of_likes = first_post.likesCounter
#       expect(number_of_likes).to eq 5
#     end
#   end
# end
