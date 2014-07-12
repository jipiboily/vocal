require 'spec_helper'

describe Vocal::Admin::AppController, :type => :controller do
  let(:user) { create :user }

  describe 'authentication' do
    context 'unauthenticated user' do
      before do
        get :app
      end

      it { expect(response).to redirect_to(login_url) }
    end

    context 'authenticated user' do
      before do
        sign_in_as user
        get :app
      end

      it { is_expected.to render_template('admin_app') }
    end
  end
end