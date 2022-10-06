class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'user'
  has_many :likes, foreign_key: 'user'
  has_many :comments, foreign_key: 'user'

  def recent_3_posts
    posts.limit(3).order(created_at: :desc)
  end

  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
