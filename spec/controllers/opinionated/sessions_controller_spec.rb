require 'spec_helper'

describe Opinionated::SessionsController do
  let(:user) { create :user }

  describe 'GET #new' do
    context 'unauthenticated user' do
      before do
        get :new
      end

      it { expect(response).to render_template(:new) }
    end

    context 'authenticated user' do
      before do
        sign_in_as user
        get :new
      end

      it { expect(response).to redirect_to(admin_path) }
    end
  end
end