require 'spec_helper'

describe Vocal::MetaGenerator do
  let(:post) { nil }
  subject { described_class.new(post) }

  describe '#title' do
    context 'for a post' do
      let(:post) { create(:post) }

      it { expect(subject.title).to eq "#{post.title} by @#{Vocal.config.social.twitter.username}" }
    end

    context 'for main page' do
      it { expect(subject.title).to eq Vocal.config.meta.title }
    end
  end

  describe '#description' do
    context 'for a post' do
      let(:post) { create(:post, html: ('<p>this is it!.</p>' * 30) ) }

      it { expect(subject.description).not_to include('<p>')  }
      it { expect(subject.description.length).to eq 155 }
    end

    context 'for main page' do
      it { expect(subject.description).to eq Vocal.config.meta.description }
    end
  end

  describe '#image' do
    it { expect(subject.image).to eq Vocal.config.meta.image_url }
  end
end
