require 'spec_helper'

describe Opinionated::SessionsController do
  let(:user) { create :user }

  describe 'GET #new' do
    context 'unauthenticated user' do
      context 'no user account created yet' do
        before do
          get :new
        end

        it { expect(response).to redirect_to signup_path }
      end

      context 'at least one user created' do
        before do
          create :user
          get :new
        end

        it { expect(response).to render_template(:new) }
      end
    end

    context 'authenticated user' do
      before do
        sign_in_as user
        get :new
      end

      it { expect(response).to redirect_to(admin_path) }
    end
  end

  describe 'POST #create' do
    context 'valid credentials' do
      before do
        post :create, email: user.email, password: 'passwd123'
      end

      it { expect(session[:opinionated_user_id]).to eq Opinionated::User.last.id }
      it { expect(response).to redirect_to(admin_path) }
    end

    context 'invalid credentials' do
      before do
        post :create, email: user.email, password: 'm...'
      end

      it { expect(session[:opinionated_user_id]).to be_nil }
      it { expect(response).to render_template(:new) }
    end
  end

  describe 'GET #logout' do
    before do
      sign_in_as user
      get :destroy
    end

    it { expect(session[:opinionated_user_id]).to be_nil }
    it { expect(response).to redirect_to(login_path) }
  end
end