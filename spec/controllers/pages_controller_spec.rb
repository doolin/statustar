# frozen_string_literal: true
require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = 'Statustar'
  end

  describe "GET 'home'" do
    describe 'when not signed in' do
      before(:each) do
        get :home
      end

      it 'succeeds' do
        expect(response).to be_success
      end

      it 'has the right title' do
        # find(:xpath, "//title").text.should match("#{@base_title} | Home")
        expect(response.body).to match(/#{@base_title} | Home/)
        # response.body.should have_xpath('.//title') #, text: "#{@base_title} | Home")
        # response.body.should have_selector(:xpath, '//title', text: "#{@base_title} | Home")
      end
    end
  end

  describe "GET 'contact'" do
    it 'succeeds' do
      get 'contact'
      # response.should be_success
      expect(response).to be_success
    end

    it 'has the right title' do
      get 'contact'
      expect(response.body).to match(/#{@base_title} | Contact/)
      # assert page.has_xpath?('//title', text: @base_title + " | Contact")
      # expect(page).to have_title("My Title")
      # response.should have_selector("title", :text => @base_title + " | Contact")
    end
  end

  describe "GET 'about'" do
    it 'succeeds' do
      get 'about'
      expect(response).to be_success
    end

    it 'has the right title' do
      get 'about'
      expect(response.body).to match(/#{@base_title} | About/)
      # response.should have_selector("title", :text => @base_title + " | About")
    end
  end

  describe "GET 'help'" do
    it 'succeeds' do
      get 'help'
      expect(response).to be_success
    end

    it 'has the right title' do
      get 'help'
      expect(response.body).to match(/#{@base_title} | Help/)
      # response.should have_selector("title", :text => @base_title + " | Help")
    end
  end
end
