require 'spec_helper'
require 'nokogiri'

describe Vocal::FeedsController, :type => :controller do
  describe 'GET #index' do
    render_views

    let!(:unpublished_post) { create(:post) }
    let!(:last_published_post) { create(:post, :published, title: 'new post', published_at: '2014-12-30') }
    let!(:first_published_post) { create(:post, :published, title: 'old post', published_at: '2014-12-27') }

    let(:rss) { Nokogiri::XML.parse(response.body) }

    before do
      get :index
    end

    it { expect(response.body).to include '<title>My Blog</title>' }
    it { expect(response.body).to include '<description>My awesome blog</description>' }
    it { expect(response.body).to include "<link>#{root_url}</link>" }

    it 'includes them ordered by published_at' do
      expect(rss.css('item').first.css('pubDate').text).to eq '30 Dec 2014'
      expect(rss.css('item').last.css('pubDate').text).to eq '27 Dec 2014'
    end

    it 'includes only published posts' do
      expect(rss.css('item').count).to eq 2
    end

    it 'sets the right title and description for posts' do
      expect(rss.css('item').first.css('title').text).to eq 'new post'
      expect(rss.css('item').first.css('description').text).to eq last_published_post.html

      expect(rss.css('item').last.css('title').text).to eq 'old post'
      expect(rss.css('item').last.css('description').text).to eq last_published_post.html
    end

    it 'sets the full links to the posts' do
      expect(rss.css('item').first.css('link').text).to eq root_url + last_published_post.url
      expect(rss.css('item').first.css('guid').text).to eq root_url + last_published_post.url
      expect(rss.css('item').last.css('link').text).to eq root_url + first_published_post.url
      expect(rss.css('item').last.css('guid').text).to eq root_url + first_published_post.url
    end
  end
end
