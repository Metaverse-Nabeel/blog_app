class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  after_create :increment_comments_counter
  after_destroy :decrement_comments_counter

  def increment_comments_counter
    post.increment!(:CommentsCounter)
  end

  def decrement_comments_counter
    post.decrement!(:CommentsCounter)
  end
end
