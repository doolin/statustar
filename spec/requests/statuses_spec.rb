# frozen_string_literal: true
require 'spec_helper'

describe 'Statuses' do
  let(:status) { create :status }

  describe 'new' do
    it 'renders new template' do
      get new_status_path
      expect(response).to render_template('statuses/new')
    end
  end

  describe 'show' do
    it 'renders show template' do
      get status_path(status)
      expect(response).to render_template('statuses/show')
    end
  end

  describe 'edit' do
    it 'renders edit template' do
      get edit_status_path(status)
      expect(response).to render_template('statuses/edit')
      expect(response).to render_template('statuses/_form')
      expect(response).to render_template('layouts/statuses')
    end
  end

  describe 'index' do
    it 'renders index template' do
      get statuses_path
      expect(response).to render_template('statuses/index')
      expect(response).to render_template('layouts/statuses')
    end
  end

  describe 'delete' do
    it 'renders delete template' do
      delete status_path(status)
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'update' do
    it 'renders update template' do
      put status_path(status)
      expect(response).to redirect_to(status_path(status))
    end
  end
end
