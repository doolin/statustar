# frozen_string_literal: true
require 'spec_helper'

describe StatusesController do
  render_views

  describe 'index' do
    it 'renders template' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show' do
    it 'renders template' do
      status = create :status
      get :show, id: status.id
      expect(response).to render_template(:show)
    end
  end

  describe 'new' do
    it 'renders template' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'edit' do
    it 'renders template' do
      status = create :status
      get :edit, id: status.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'create' do
    it 'renders template' do
      user = create :user
      test_sign_in(user)
      post :create, status: { state: 1 }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'update' do
    xit 'renders template' do
      post :update
      expect(response).to render_template(:update)
    end
  end

  describe 'destroy' do
    it 'renders template' do
      status = create :status
      expect do
        delete :destroy, id: status.id
        expect(response).to redirect_to(root_path)
      end.to change(Status, :count).by(-1)
    end
  end
end
