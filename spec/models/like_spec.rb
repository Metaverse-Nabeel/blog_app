require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user1) { User.create(name: 'Jill', photo: 'photo url here', bio: 'Bio text here', posts_counter: 0) }
  let(:post1) do
    Post.create(author: user1, title: 'title-1', text: 'This is the text of my post', comments_counter: 0,
                likes_counter: 0)
  end
  subject { Like.create(post: post1, author: user1) }

  before { subject.save }

  it 'is associated with an author' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'is associated with a post' do
    association = described_class.reflect_on_association(:post)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'updates the likes counter of the post' do
    user1 = User.create(name: 'Jill', photo: 'photo url here', bio: 'Bio text here', posts_counter: 0)
    post1 = Post.create(author: user1, title: 'title-1', text: 'This is the text of my post', comments_counter: 0,
                        likes_counter: 0)

    expect do
      Like.create(post: post1, author: user1)
      post1.reload
    end.to change { post1.likes_counter }.by(1)
  end
end
