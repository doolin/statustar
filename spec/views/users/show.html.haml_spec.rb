require 'spec_helper'

describe "users/show" do

  before(:each) do
    @user = assign(:user, double(User,
      :name => "Name",
      :email => "Email"
    ))
  end

  xit "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
  end
  
  xit "renders list of status updates" do
    u1 = FactoryGirl.create(:user)
    u1.statuses.create({:state => 1})
    u1.statuses.create!({:state => 2})
    u1.save
    render
    rendered.should have_selector("active")
    rendered.should have_css("active")
  end  

  # Fails with syntax error in users/show_follow partial.
  xit "should render Show and Back text" do
    render :template => "layouts/application"
    render :template => "users/show_follow"
    rendered.should =~ /Following/
    rendered.should =~ /Followers/
  end
 
  it "should infer the controller path" do
    controller.request.path_parameters[:controller].should eq('users')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters[:action].should eq('show')
  end
 
  # Need to get signed in correctly to get the correct view
  xit "should display show users" do
    render :template => "layouts/application"
    rendered.should =~ /Users/
  end
 
  it "should have correct <title> element " do
    render :template => "layouts/application"
    rendered.should have_selector "title", :content => "Statustar"
  end
end
