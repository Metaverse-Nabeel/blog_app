require 'rails_helper'

describe User, type: :model do
  subject { User.create(name: 'Atif', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'A Pakistani Micronauts.', posts_counter: 0) }

  before { subject.save }

  it 'user successfully created' do
    expect(subject).to be_valid
  end

  it 'name cannot be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter cannot be blank' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'name cannot be empty' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be an integer' do
    subject.posts_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater or equal to 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'posts_counter should not be less than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be bigger or equal to 0' do
    subject.posts_counter = 200
    expect(subject).to be_valid
  end

  describe '#three_most_recent_posts' do
    let!(:user) { User.create(name: 'Tom') }
    let!(:post1) { Post.create(author: user, title: 'Post 1', created_at: 1.day.ago) }
    let!(:post2) { Post.create(author: user, title: 'Post 2', created_at: 2.days.ago) }
    let!(:post3) { Post.create(author: user, title: 'Post 3', created_at: 3.days.ago) }
    let!(:post4) { Post.create(author: user, title: 'Post 4', created_at: 4.days.ago) }

    it 'returns an empty array if the user has no posts' do
      user.posts.destroy_all
      expect(user.three_most_recent_posts).to be_empty
    end
  end
end
