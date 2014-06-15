require 'spec_helper'

describe Opinionated::Admin::PostsController, :type => :controller do
  let(:user) { create :user }

  before do
    sign_in_as user
  end

  describe '#create' do
    let(:new_post) { Opinionated::Post.last }

    it {
      expect {
        post :create, post: { title: 'meh' }
      }.to change(Opinionated::Post, :count).by(1)
    }

    context 'published == true' do
      it 'sets the post to published state' do
        post :create, post: { title: 'meh', published: 'true', published_at: '2014/12/30' }
        expect(new_post.published?).to be_truthy
      end
    end

    context 'published != true' do
      it 'sets the post to the draft state' do
        post :create, post: { title: 'meh', published: 'false' }
        expect(new_post.draft?).to be_truthy
      end
    end

    describe 'author is current user' do
      before do
        post :create, post: { title: 'meh' }
      end

      it { expect(Opinionated::Post.last.user_id).to eq user.id }
    end
  end

  describe '#update' do
    let(:post) { create(:post) }

    it 'updates title' do
      put :update, id: post.id, post: { title: 'Hey!' }
      post.reload
      expect(post.title).to eq 'Hey!'
    end

    describe 'publish state' do
      context 'published == true' do
        it 'sets the post to published state' do
          put :update, id: post.id, post: { title: 'meh', published: 'true' }
          expect(post.reload.published?).to be_truthy
        end
      end

      context 'published != true' do
        let(:post) { create(:post, :published) }

        it 'sets the post to the draft state' do
          put :update, id: post.id, post: { title: 'meh', published: 'false' }
          expect(post.reload.draft?).to be_truthy
        end
      end
    end
  end
end