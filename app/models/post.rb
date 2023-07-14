class Post < ApplicationRecord
  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :user, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_create :increment_post_counter
  after_destroy :decrement_post_counter

  def increment_post_counter
    user.increment!(:post_counter)
  end

  def decrement_post_counter
    user.decrement!(:post_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
