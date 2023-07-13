class Like < ApplicationRecord
    belongs_to :user, foreign_key: 'author_id'
    belongs_to :post, foreign_key: 'post_id'

    def increment_like_counter
      puts 'Incrementing like counter'
      user.increment!(:likes_counter)
    end
end
