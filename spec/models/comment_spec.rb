require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user1 = User.new(name: 'Nabeel', photo: 'image url here', bio: 'Front end developer')
  @user2 = User.new(name: 'Ahmed', photo: 'image  url here', bio: 'Back end developer')
  @post1 = Post.new(author: @user1, title: 'Hello', text: 'first test post')

  subject { Comment.create(post: @post1, author: @user2, text: 'Hi Nabeel!') }
  before { subject.save }

  it 'must have text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'must have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'must have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'must belong to an author' do
    association = Comment.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'must belong to a post' do
    association = Comment.reflect_on_association(:post)
    expect(association.macro).to eq(:belongs_to)
  end
  it 'update comments_counter for the post' do
    user1 = User.create(
      name: 'Nabeel',
      photo: 'image url here',
      bio: 'bio text here',
      posts_counter: 0
    )
    post1 = Post.create(author: user1, title: 'title-1', text: 'this is my first post', comments_counter: 0,
                        likes_counter: 0)
    Comment.create(post: post1, author: user1, text: 'Hi Nabeel!')
    commented_post = Post.find_by_author_id(post1.author_id)
    expect(commented_post.comments_counter).to eq 2
  end
end
