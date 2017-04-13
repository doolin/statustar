# frozen_string_literal: true

require 'spec_helper'

describe SessionsController do
  render_views

  describe '.new' do
    it 'succeeds' do
      get :new
      expect(response).to be_success
    end

    it 'has the right title' do
      get :new
      expect(response.body).to match(/Sign in/)
      # response.should have_selector("title", :text => "Sign in")
    end
  end

  describe '.create' do
    context 'with invalid signin' do
      before(:each) do
        @attr = { email: 'email@example.com', password: 'invalid' }
      end

      it 're-renders the new page' do
        post :create, params: { session: @attr }
        expect(response).to render_template('new')
      end

      it 'has the right title' do
        post :create, params: { session: @attr }
        expect(response.body).to match(/Sign in/)
        # respsonse.should have_selector("title", :text => "Sign in")
      end

      it 'displays flash message for invalid signin' do
        post :create, params: { session: @attr }
        # flash.now[:error].should =~ /invalid/i
        expect(flash.now[:error]).to match(/invalid/i)
      end
    end

    context 'with valid email and password' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @attr = { email: @user.email, password: @user.password }
      end

      it 'signs in the user' do
        post :create, params: { session: @attr }
        expect(controller.current_user).to eq @user
        expect(controller).to be_signed_in
      end

      it 'redirects to the user show page' do
        post :create, params: { session: @attr }
        expect(response).to redirect_to(user_path(@user))
      end
    end
  end

  describe '.destroy' do
    it 'signs out user' do
      test_sign_in(FactoryGirl.create(:user))
      delete :destroy
      expect(controller).to_not be_signed_in
      expect(response).to redirect_to(root_path)
    end
  end
end
