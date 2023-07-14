class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

   after_save :increment_comment_counter

  def increment_comment_counter
    puts 'Incrementing comment counter'
    post.increment!(:comments_counter)
  end
end
