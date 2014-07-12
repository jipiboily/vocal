require 'spec_helper'

describe Vocal::User, :type => :model do
  let(:user) { create(:user) }

  describe ' @post with the current post if pu' do
    it { is_expected.to have_many(:posts) }
  end

  describe 'validations' do
    it 'validate_uniqueness_of :email' do
      new_user = Vocal::User.new(email: user.email)
      expect(new_user.valid?).to eq false
      expect(new_user.errors.messages[:email]).to eq ['has already been taken']
    end

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
  end
end