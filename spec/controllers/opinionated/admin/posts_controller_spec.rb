require 'spec_helper'

describe Opinionated::Admin::PostsController do
  let(:user) { create :user }

  before do
    sign_in_as user
  end

  describe '#create' do
    it {
      expect {
        post :create, post: { title: 'meh' }
      }.to change(Opinionated::Post, :count).by(1)
    }
  end

  describe '#update' do
    let(:post) { create(:post) }

    it 'updates title' do
      put :update, id: post.id, post: { title: 'Hey!' }
      post.reload
      expect(post.title).to eq 'Hey!'
    end
  end
end