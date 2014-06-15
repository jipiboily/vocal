require 'spec_helper'

describe Opinionated::User do
  let(:user) { create(:user) }

  describe :relations do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it 'validate_uniqueness_of :email' do
      new_user = Opinionated::User.new(email: user.email)
      expect(new_user.valid?).to eq false
      expect(new_user.errors.messages[:email]).to eq ['has already been taken']
    end

    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
  end
end