# frozen_string_literal: true
require 'spec_helper'

describe 'LayoutLinks' do
  it "should have a Home page at '/'" do
    visit '/'
    expect(page).to have_title('Statustar | Home')
  end

  it "should have a Contact page at '/contact'" do
    visit '/contact'
    expect(page).to have_title('Statustar | Contact')
  end

  it "should have an About page at '/about'" do
    visit '/about'
    expect(page).to have_title('Statustar | About')
  end

  it "should have a Help page at '/help'" do
    visit '/help'
    expect(page).to have_title('Statustar | Help')
  end

  it 'should have the right links on the layout' do
    visit root_path
    click_link 'About'
    expect(page).to have_title('Statustar | About')
    click_link 'Help'
    expect(page).to have_title('Statustar | Help')
    click_link 'Contact'
    expect(page).to have_title('Statustar | Contact')
    click_link 'Home'
    expect(page).to have_title('Statustar | Home')
  end

  describe 'when not signed in' do
    it 'should have a signin link' do
      visit root_path
      # Working xpath, finally. Keep this around for a bit as working example.
      # xp = find("/html/body/div/div/header/div[1]/div/nav/ul/li[3]/a").text
      # ap xp
      expect(page).to have_selector('a', text: 'Sign in')
    end
  end

  describe 'when signed in' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      integration_sign_in @user
    end

    it 'should have a signout link' do
      visit root_path
      expect(page).to have_selector('a', text: 'Sign out')
      # response.should have_selector("a", :href => signout_path, :content => "Sign out")
    end

    it 'should have a users link' do
      visit root_path
      expect(page).to have_selector('a', text: 'Users')
      # response.should have_selector("a", :href => users_path, :content => "Users")
    end

    it 'should have a profile link' do
      visit root_path
      expect(page).to have_selector('a', text: 'Profile')
      # response.should have_selector("a", :href => user_path(@user), :content => "Profile")
    end

    it "should have a Users page at '/users'" do
      visit users_path
      expect(page).to have_content('All users')
      # response.should have_selector('title', :content => "All users")
    end

    it 'as non-admin should not have a delete link' do
      visit users_path
      expect(page).not_to have_selector('a[href]', text: 'delete')
      # response.should_not have_selector("a[href]", :content => "delete")
    end
  end

  describe 'when signed in as admin' do
    before(:each) do
      admin = FactoryGirl.create(:user, email: 'admin@example.com', admin: true)
      integration_sign_in(admin)
    end

    it 'you should not have a delete link for yourself' do
      visit users_path
      expect(page).not_to have_selector('a[href]', text: 'delete')
    end
  end
end
