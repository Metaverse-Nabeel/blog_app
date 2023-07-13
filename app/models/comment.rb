class Comment < ApplicationRecord
    belongs_to :user, foreign_key: 'author_id'
    belongs_to :post, foreign_key: 'post_id'

    def increment_comment_counter
      puts 'Incrementing comment counter'
      user.increment!(:comments_counter)
    end

end
