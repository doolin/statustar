# frozen_string_literal: true
require 'spec_helper'

describe StatusesController do
  render_views

  describe 'hello' do
    xit 'renders template' do
      get :hello
      expect(response).to render_template(:hello)
    end
  end

  describe 'index' do
    it 'renders template' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show' do
    xit 'renders template' do
      get :show, params: { id: 1 }
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
    xit 'renders template' do
      status = create :status
      get :edit, params: { id: status.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'create' do
    xit 'renders template' do
      post :create, params: attributes_for(:status)
      expect(response).to have_http_status(:created)
      expect(response).to repostnder_template(:create)
    end
  end

  describe 'update' do
    xit 'renders template' do
      post :update
      expect(response).to render_template(:update)
    end
  end

  describe 'destroy' do
    xit 'renders template' do
      delete :destroy
      expect(response).to render_template(:destroy)
    end
  end
end
