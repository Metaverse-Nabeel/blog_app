require 'rails_helper'

describe Post, type: :model do
  subject do
    first_user = User.create(name: 'Atif', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'A pakistani micronaut.', posts_counter: 0)
    Post.create(author: first_user, title: 'Hello', text: 'This is a personal post', likes_counter: 0,
                comments_counter: 0)
  end

  before { subject.save }

  it 'title cannot be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'created successful' do
    expect(subject).to be_valid
  end

  it "should check number of the  title's characters" do
    subject.title = "Lorem ipsum dolor sit, amet consectetur adipisicing elit.
    Eius dolorum velit modi suscipit Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius dolorum
    velit modi suscipit unde dignissimos unde dignissimos alias deserunt beatae sit
    vitae corrupti illum ad ratione,
    corrupti illum ad ratione, voluptas nobis. Velit nisi soluta sint
    voluptas nobis. Velit nisi soluta sint.
     alias deserunt beatae sit vitae."
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater or equal to 0' do
    subject.comments_counter = 0
    expect(subject).to be_valid
    subject.comments_counter = 200
    expect(subject).to be_valid
  end

  it 'comments_counter cannot be a negative' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be be greater or equal to 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
    subject.likes_counter = 200
    expect(subject).to be_valid
  end

  it 'likes_counter should be be integer' do
    subject.likes_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'likes_counter cannot be negative' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  describe 'scopes' do
    describe '.five_recent_comments' do
      let!(:user) { User.create(name: 'Atif Zada') }
      let!(:post) { Post.create(title: 'Test Post', author: user) }
      let!(:recent_comments) { create_comments(post, 5, 1.day.ago) }
      let!(:older_comments) { create_comments(post, 3, 2.days.ago) }

      it 'returns the five most recent comments for the post' do
        expect(Post.five_recent_comments(post)) == (recent_comments.reverse)
      end

      it 'limits the result to five comments' do
        expect(Post.five_recent_comments(post).count) == (5)
      end
    end
  end
  def create_comments(post, count, created_at)
    comments = []
    count.times do
      comments << Comment.create(post:, created_at:)
    end
    comments
  end
  describe '#update_posts_counter' do
    let!(:author) { User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'A user', posts_counter: 0) }
    let!(:post) do
      Post.create(author:, title: 'Test Post', text: 'This is a test post', likes_counter: 0, comments_counter: 0)
    end

    it 'increments the posts_counter of the author' do
      expect { post.update_posts_counter }.to change { author.reload.posts_counter }.by(1)
    end
  end
end
