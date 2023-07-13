class Post < ApplicationRecord
    has_many :comments, foreign_key: 'post_id'
    has_many :likes, foreign_key: 'post_id'
    belongs_to :author_id, class_name: 'User'

end
