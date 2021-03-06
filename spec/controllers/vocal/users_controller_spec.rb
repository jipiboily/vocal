require 'spec_helper'

describe Vocal::UsersController, :type => :controller do
  describe 'GET #new' do
    context 'unauthenticated' do
      before do
        get :new
      end

      it { expect(assigns(:user)).to be_a_new(Vocal::User) }
    end

    context 'authenticated' do
      before do
        create(:user)
        get :new
      end

      it { expect(response).to redirect_to(admin_path) }
    end
  end

  describe 'POST #create' do
    def create_valid_user
      post :create, user: { name: 'JP', email: 'me@example.com', password: 'meh', password_confirmation: 'meh' }
    end

    context 'valid user' do
      it  {
        create_valid_user
        expect(response).to redirect_to(admin_path)
      }

      it {
        expect {
          create_valid_user
        }.to change(Vocal::User, :count).by(1)
      }

      it {
        expect(session[:vocal_user_id]).to be_nil
        create_valid_user
        expect(session[:vocal_user_id]).not_to be_nil
        expect(session[:vocal_user_id]).to eq Vocal::User.last.id
      }
    end

    context 'invalid user' do
      before do
        post :create, user: { name: '' }
      end

      it { expect(response).to render_template(:new) }
    end
  end
end