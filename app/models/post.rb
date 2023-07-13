class Post < ApplicationRecord
    has_many :comments, foreign_key: 'post_id'
    has_many :likes, foreign_key: 'post_id'
    belongs_to :user, foreign_key: 'author_id'

end
