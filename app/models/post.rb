class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :user, foreign_key: 'author_id'

  after_create :increment_post_counter
  after_destroy :decrement_post_counter

  def increment_post_counter
    puts 'Incrementing post counter'
    user.increment!(:post_counter)
  end

  def decrement_post_counter
    puts 'Decrementing post counter'
    user.decrement!(:post_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
