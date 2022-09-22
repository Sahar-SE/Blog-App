class Post < ApplicationRecord
  belongs_to :user

  after_save :update_comment_counter

  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    user.increment!(:post_counter)
  end

  def five_most_recent_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
