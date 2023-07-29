class User < ApplicationRecord
  before_validation :set_default
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  def set_default
    self.name = email.split('@')[0]
    self.posts_counter = 0
  end

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    posts.order(created_at: :asc).limit(3).reverse
  end
end
