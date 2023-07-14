require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#Test for increment_likes_counter' do
    it 'increments the LikesCounter of the associated post' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'Test post text', CommentsCounter: 0,
                         LikesCounter: 0)

      like = Like.create(author_id: user.id, post_id: post.id)
      expect { like.increment_likes_counter }.to change { post.reload.LikesCounter }.by(1)
    end
  end

  describe '#Test for decrement_likes_counter' do
    it 'decrement the LikesCounter of the associated post' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 2)
      post = Post.create(author_id: user.id, Title: 'Second Test Post', Text: 'Test post text', CommentsCounter: 6,
                         LikesCounter: 4)

      like = Like.create(author_id: user.id, post_id: post.id)
      expect { like.decrement_likes_counter }.to change { post.reload.LikesCounter }.by(-1)
    end
  end
end
