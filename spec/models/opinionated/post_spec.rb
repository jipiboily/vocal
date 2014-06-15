require 'spec_helper'

module Opinionated
  describe Post do
    describe 'before_save :generate_url' do
      it 'generates a url with the title' do
        post = Post.new
        post.title = 'Some title!'
        post.user = create(:user)
        post.save
        expect(post.reload.url).to eq 'some-title'
      end
    end

    describe 'states' do
      let(:post) { build(:post, :draft) }

      it { expect(Post.new.draft?).to be_true }

      describe '#publish!' do
        before { post.publish! }

        it { expect(post.published?).to be_true }
      end

      describe '#unpublish!' do
        before { post.unpublish! }

        it { expect(post.draft?).to be_true }
      end

      describe '#delete!' do
        before { post.delete! }

        it { expect(post.deleted?).to be_true }
      end
    end

    describe :relations do
      it { should belong_to(:user) }
    end

    describe :validations do
      it { should validate_presence_of(:user_id) }

      context 'published' do
        it 'requires a published_at date to actually a post' do
          post = Post.new(state: :published)
          post.valid?
          expect(post.errors.messages[:published_at]).to include("can't be blank")
        end
      end
    end

    describe '#published_at=' do
      it 'assumes mm/dd/yyyy' do
        post = Post.new
        post.published_at = '2014-12-30'
        expect(post.published_at).to eq Date.new(2014,12,30)
      end
    end
  end
end