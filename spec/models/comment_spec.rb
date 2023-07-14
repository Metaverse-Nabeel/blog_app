require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Test for increment_comments_counter' do
    it 'Increment in LikesCounter of associated post' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'My Test Post', Text: 'My Test post in testing', CommentsCounter: 0, LikesCounter: 0)
      
      comment = Comment.create(author_id: user.id, post_id: post.id, Text: 'Test my comments!')
      expect { comment.increment_comments_counter }.to change { post.reload.CommentsCounter }.by(1)
    end
  end
  
  describe 'Test for decrement_comments_counter' do
    it 'Decrement the LikesCounter of the associated post' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'My Test Post', Text: 'My Test post in testing', CommentsCounter: 2, LikesCounter: 2)

      comment = Comment.create(author_id: user.id, post_id: post.id, Text: 'My Second Test Comment!')
      expect { comment.decrement_comments_counter }.to change { post.reload.CommentsCounter }.by(-1)
    end
  end
end
