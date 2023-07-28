class User < ApplicationRecord
  #Add code here
  
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    posts.order(created_at: :asc).limit(3).reverse
  end

end
