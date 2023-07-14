require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'This is a test post', CommentsCounter: 2, LikesCounter: 1) }

  before { subject.save }

  it '#test Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it '#test Title must not exceed 250 characters' do
    subject.Title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it '#test CommentsCounter should be greater than or equal to 0' do
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it '#test LikesCounter should be greater than or equal to 0' do
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end

  describe '#Test for increment_post_counter' do
    it '#test increments the post_counter of the associated user' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'My Test Post', Text: 'My Test post in testing',
                         CommentsCounter: 0, LikesCounter: 0)
      expect { post.increment_post_counter }.to change { user.reload.post_counter }.by(1)
    end
  end

  describe '#Test for decrement_post_counter' do
    it '#test decrements the post_counter of the associated user' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 4)
      post = Post.create(author_id: user.id, Title: 'My Test Post', Text: 'My Test post in testing',
                         CommentsCounter: 0, LikesCounter: 0)

      expect { post.decrement_post_counter }.to change { user.reload.post_counter }.by(-1)
    end
  end

  describe '#Test forrecent_comments' do
    it '#test returns the five most recent comments' do
      # Create a user
      user = User.create(name: 'Nabeel Ahmed', post_counter: 0)

      # Create a post
      post = Post.create(author_id: user.id, Title: 'My Test Post', Text: 'My Test post in testing',
                         CommentsCounter: 0, LikesCounter: 0)

      # Create test comments for the post
      Comment.create(post_id: post.id, author_id: user.id, Text: 'Hi Nabeel!')
      comment2 = Comment.create(post_id: post.id, author_id: user.id, Text: 'Hi Nabeel!')
      comment3 = Comment.create(post_id: post.id, author_id: user.id, Text: 'Hi Nabeel!')
      comment4 = Comment.create(post_id: post.id, author_id: user.id, Text: 'Hi Nabeel!')
      comment5 = Comment.create(post_id: post.id, author_id: user.id, Text: 'Hi Nabeel!')
      comment6 = Comment.create(post_id: post.id, author_id: user.id, Text: 'Hi Nabeel!')

      newer_comments = [comment6, comment5, comment4, comment3, comment2]

      # Ensure that only the five most recent comments are returned
      expect(post.recent_comments).to eq(newer_comments)
    end
  end
end
