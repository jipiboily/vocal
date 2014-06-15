require 'spec_helper'

describe Opinionated::PostsController, :type => :controller do
  describe '#index' do
    it 'sets @posts with published posts' do
      expect(Opinionated::Post).to receive(:published).and_call_original
      get :index
    end

    it 'sets @posts with posts in right order' do
      second_in_list = create(:post, :published, published_at: '2014-12-30')
      first_in_list = create(:post, :published, published_at: '2014-12-31')
      get :index
      expect(assigns(:posts).first).to eq first_in_list
      expect(assigns(:posts).last).to eq second_in_list
    end
  end

  describe '#show' do
    context 'published' do
      let(:post) { create(:post, :published) }

      it 'sets @post with the current post if published' do
        get :show, post_url: post.url
        expect(assigns(:post)).to be_a Opinionated::Post
      end
    end

    context 'draft' do
      let(:post) { create(:post, :draft) }

      it 'errors out 404 if post is not published' do
        get :show, post_url: post.url
        expect(response.status).to eq 404
      end
    end

    context 'does not exist at all' do
      it 'errors out 404 if there is no post there' do
        get :show, post_url: 'nowhere'
        expect(response.status).to eq 404
      end
    end
  end
end