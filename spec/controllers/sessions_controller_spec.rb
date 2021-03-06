# frozen_string_literal: true

require 'spec_helper'

describe SessionsController do
  render_views

  describe '.new' do
    it 'succeeds' do
      get :new
      expect(response).to be_successful
    end

    it 'has the right title' do
      get :new
      expect(response.body).to match(/Sign in/)
    end
  end

  describe '.create' do
    context 'with invalid signin' do
      before(:each) do
        @attr = { email: 'email@example.com', password: 'invalid' }
      end

      it 're-renders the new page' do
        post :create, params: { session: @attr }
        expect(response).to have_http_status(:ok)
      end

      it 'has the right title' do
        post :create, params: { session: @attr }
        expect(response.body).to match(/Sign in/)
      end

      it 'displays flash message for invalid signin' do
        post :create, params: { session: @attr }
        expect(flash.now[:error]).to match(/invalid/i)
      end
    end

    context 'with valid email and password' do
      let(:user) { create :user }
      let(:attr) { { email: user.email, password: user.password } }

      it 'signs in the user' do
        post :create, params: { session: attr }
        expect(controller.current_user).to eq user
        expect(controller).to be_signed_in
      end

      it 'redirects to the user show page' do
        post :create, params: { session: attr }
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe '.destroy' do
    it 'signs out user' do
      test_sign_in(create(:user))
      delete :destroy
      expect(controller).to_not be_signed_in
      expect(response).to redirect_to(root_path)
    end
  end
end
