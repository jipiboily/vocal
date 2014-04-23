require 'spec_helper'

module Opinionated
  describe Post do
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