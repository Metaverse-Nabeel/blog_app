require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Nabeel Ahmed', post_counter: 0) }

  before { subject.save }

  it '#test name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it '#test post_counter should be greater than or equal to 0' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#test for recent_posts' do
    it '#test must return 3 recent posts' do
      user = User.create(name: 'Nabeel Ahmed', post_counter: 0)
      Post.create(Title: 'This is a post', CommentsCounter: 2, LikesCounter: 1, author_id: user.id)
      Post.create(Title: 'This is a post', CommentsCounter: 2, LikesCounter: 1, author_id: user.id)
      post3 = Post.create(Title: 'This is also a post', CommentsCounter: 2, LikesCounter: 1, author_id: user.id)
      post4 = Post.create(Title: 'This is also a post', CommentsCounter: 2, LikesCounter: 1, author_id: user.id)
      post5 = Post.create(Title: 'This is also a post', CommentsCounter: 2, LikesCounter: 1, author_id: user.id)
      expect(user.recent_posts).to eq([post5, post4, post3])
    end
  end
end
