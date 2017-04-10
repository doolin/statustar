# frozen_string_literal: true
require 'spec_helper'

describe StatusesController do
  let(:user) { create :user }

  render_views

  describe 'index' do
    context 'signed in' do
      it 'renders template with :ok' do
        test_sign_in(user)
        get :index
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'signed out' do
      it 'renders template with :found' do
        get :index
        expect(response).to redirect_to(signin_path)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'show' do
    it 'renders template with :ok' do
      status = create :status, user: user
      get :show, params: { id: status.id }
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'new' do
    context 'signed in' do
      it 'renders template with ok' do
        test_sign_in(user)
        get :new
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'signed out' do
      it 'renders template with ok' do
        get :new
        expect(response).to redirect_to(signin_path)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'edit' do
    it 'renders template' do
      test_sign_in(user)
      status = create :status, user: user
      get :edit, params: { id: status.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'create' do
    it 'renders template' do
      test_sign_in(user)
      post :create, params: { status: { state: 1 } }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'update' do
    context 'signed in' do
      it 'redirects to status page' do
        test_sign_in(user)
        status = create :status, user: user
        # TODO: valid states are 1..3, need to add a spec for invalid state update attempt.
        patch :update, params: { id: status.id, status: { state: 1 } }
        expect(response).to redirect_to(status_path(status))
        expect(response).to have_http_status(:found)
      end
    end

    context 'signed out' do
      it 'redirects to sign in' do
        status = create :status, user: user
        patch :update, params: { id: status.id, status: { state: 3 } }
        expect(response).to redirect_to(signin_path)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'destroy' do
    it 'redirects to root after destroying status' do
      status = create :status, user: user
      test_sign_in(user)
      expect do
        delete :destroy, params: { id: status.id }
        expect(response).to redirect_to(root_path)
      end.to change(Status, :count).by(-1)
    end
  end
end
