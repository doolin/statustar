# frozen_string_literal: true

require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = 'Statustar'
  end

  describe '.home' do
    describe 'when not signed in' do
      before(:each) do
        get :home
      end

      it 'succeeds' do
        expect(response).to be_success
      end

      it 'has the right title' do
        expect(response.body).to match(/#{@base_title} | Home/)
      end
    end
  end

  describe '.contact' do
    it 'succeeds' do
      get 'contact'
      expect(response).to be_success
    end

    # TODO: move or delete
    it 'has the right title' do
      get 'contact'
      expect(response.body).to match(/#{@base_title} | Contact/)
    end
  end

  describe '.about' do
    it 'succeeds' do
      get 'about'
      expect(response).to be_success
    end

    it 'has the right title' do
      get 'about'
      expect(response.body).to match(/#{@base_title} | About/)
    end
  end

  describe '.help' do
    it 'succeeds' do
      get 'help'
      expect(response).to be_success
    end

    it 'has the right title' do
      get 'help'
      expect(response.body).to match(/#{@base_title} | Help/)
    end
  end
end
