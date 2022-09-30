class Post < ApplicationRecord
  belongs_to :user

  after_save :update_comment_counter

  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    user.increment!(:postsCounter)
  end

  def five_most_recent_comments
    comments.order(updated_at: :desc).limit(5)
  end
  validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
