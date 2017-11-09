# frozen_string_literal: true

require 'spec_helper'

describe PagesController, type: :controller do
  render_views

  let(:base_title) { 'StatuStar' }

  describe '.home' do
    describe 'when not signed in' do
      before { get :home }

      it 'succeeds' do
        expect(response).to be_success
      end

      it 'has the right title' do
        expect(response.body).to match(/#{base_title} | Home/)
      end
    end
  end

  describe '.contact' do
    before { get :contact }

    it 'succeeds' do
      expect(response).to be_success
    end

    it 'has the right title' do
      expect(response.body).to match(/#{base_title} | Contact/)
    end
  end

  describe '.about' do
    before { get :about }

    it 'succeeds' do
      expect(response).to be_success
    end

    it 'has the right title' do
      expect(response.body).to match(/#{base_title} | About/)
    end
  end

  describe '.help' do
    before { get :help }

    it 'succeeds' do
      expect(response).to be_success
    end

    it 'has the right title' do
      expect(response.body).to match(/#{base_title} | Help/)
    end
  end
end
