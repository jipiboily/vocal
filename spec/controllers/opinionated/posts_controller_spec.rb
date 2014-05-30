require 'spec_helper'

describe Opinionated::PostsController do
  describe '#index' do
    it 'sets @posts with published posts' do
      Opinionated::Post.should_receive(:published).and_call_original
      get :index
    end

    it 'sets @posts with posts in right order' do
      second_in_list = create(:post, :published, published_at: 1.year.ago)
      first_in_list = create(:post, :published, published_at: 1.day.ago)
      get :index
      expect(assigns(:posts).first).to eq first_in_list
      expect(assigns(:posts).last).to eq second_in_list
    end
  end
end