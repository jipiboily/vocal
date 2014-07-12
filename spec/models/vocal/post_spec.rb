require 'spec_helper'

module Vocal
  describe Post, :type => :model do
    describe 'before_save :generate_url' do
      context 'with a title' do
        let(:post) { Post.new(title: 'Some title!', user: create(:user)) }
        it 'generates a url with the title' do
          post.save
          expect(post.reload.url).to eq 'some-title'
        end

        it 'generates a url if the URL is empty or nil' do
          post.url = ''
          post.save
          expect(post.reload.url).to eq 'some-title'
        end
      end

      context 'with a URL' do
        it 'does not overwrite it' do
          post = create(:post)
          post.title = 'new title'
          post.save
          expect(post.reload.url).not_to eq 'new-title'
        end
      end
    end

    describe 'states' do
      let(:post) { build(:post, :draft) }

      it { expect(Post.new.draft?).to be_truthy }

      describe '#publish!' do
        before { post.publish! }

        it { expect(post.published?).to be_truthy }
      end

      describe '#unpublish!' do
        before { post.unpublish! }

        it { expect(post.draft?).to be_truthy }
      end

      describe '#delete!' do
        before { post.delete! }

        it { expect(post.deleted?).to be_truthy }
      end
    end

    describe 'relations' do
      it { is_expected.to belong_to(:user) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:user_id) }

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