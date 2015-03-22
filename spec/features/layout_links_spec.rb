require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    visit '/'
    expect(page).to have_title('Statustar | Home')
  end

  xit "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  xit "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  xit "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  xit "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
  end
  
  describe "when not signed in" do
    xit "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign in")
    end
  end

  describe "when signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      integration_sign_in @user
     end

    xit "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end

    xit "should have a users link" do
      visit root_path
      response.should have_selector("a", :href => users_path,
                                         :content => "Users")
    end

    xit "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end

    xit "should have a Users page at '/users'" do
      visit users_path
      response.should have_selector('title', :content => "All users")
    end

    xit "as non-admin should not have a delete link" do
      visit users_path
      response.should_not have_selector("a[href]", :content => "delete")
    end
  end

  describe "when signed in as admin" do
    before(:each) do
      admin = FactoryGirl.create(:user, :email => "admin@example.com", :admin => true)
      integration_sign_in(admin)
    end

    xit "you should not have a delete link for yourself" do
      # btw, this depends on only creating one user (an admin user) for this test
      visit users_path
      response.should_not have_selector("a[href]", :content => "delete")
    end
  end
end
