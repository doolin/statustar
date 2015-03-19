require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Statustar"
  end
  
  describe "GET 'home'" do
    describe "when not signed in" do
      before(:each) do
        get :home
      end

      it "should be successful" do
        response.should be_success
      end

      it "should have the right title" do
        # find(:xpath, "//title").text.should match("#{@base_title} | Home")
        expect(response.body).to match(/#{@base_title} | Home/)
        # response.body.should have_xpath('.//title') #, text: "#{@base_title} | Home")
        # response.body.should have_selector(:xpath, '//title', text: "#{@base_title} | Home")
      end
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      expect(response.body).to match(/#{@base_title} | Contact/)
      # assert page.has_xpath?('//title', text: @base_title + " | Contact")
      response.should have_selector("title", :content => @base_title + " | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => @base_title + " | About")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "should have the right title" do
      get 'help'
      response.should have_selector("title", :content => @base_title + " | Help")
    end
  end
end
