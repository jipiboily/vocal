require 'spec_helper'

module Opinionated
  describe Post do
    describe 'before_save :generate_url' do
      it 'generates a url with the title' do
        post = Post.new
        post.title = 'Some title!'
        post.save
        expect(post.reload.url).to eq 'some-title'
      end
    end

    describe 'states' do
      it { expect(Post.new.draft?).to be_true }

      describe '#publish!' do
        let(:post) { Post.new }

        before { post.publish! }

        it { expect(post.published?).to be_true }
      end

      describe '#unpublish!' do
        let(:post) { Post.new }

        before { post.unpublish! }

        it { expect(post.draft?).to be_true }
      end

      describe '#delete!' do
        let(:post) { Post.new }

        before { post.delete! }

        it { expect(post.deleted?).to be_true }
      end
    end
  end
end