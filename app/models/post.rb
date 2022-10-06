class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    user.increment!(:postsCounter)
  end

  def recent_5_comments
    comments.order(updated_at: :desc).limit(5)
  end
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
