require 'spec_helper'




describe "Statuses" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      xit "should not make a new status" do
        lambda do
          visit root_path
          choose('Busy')
          #fill_in :micropost_content, :with => ""
          click_button "Create Status"
          #response.should render_template('pages/home')
          #response.should have_selector("div#error_explanation")
        end.should_not change(Status, :count)
      end
    end

    describe "success" do

      it "should make a new status" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          choose('Busy')
          #fill_in :micropost_content, :with => content
          click_button "Create Status"
        end.should change(Status, :count).by(1)
      end
    end
  end
end

=begin
describe "Statuses" do
  describe "GET /statuses" do
    
    # This should not work, only :create, :destroy for microposts
    xit "works! (now write some real specs)" do
      get statuses_path
    end
  end
end
=end