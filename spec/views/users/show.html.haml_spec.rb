require 'spec_helper'

# describe "users/show.html.haml" do

#   before(:each) do
#     @user = assign(:user, stub_model(User,
#       :name => "Name",
#       :email => "Email"
#     ))
#   end

#   it "renders attributes in <p>" do
#     render
#     rendered.should match(/Name/)
#     #rendered.should match(/Email/)
#   end
  
  
#   xit "renders list of status updates" do
#     u1 = Factory(:user)
#     u1.statuses.create({:state => 1})
#     u1.statuses.create!({:state => 2})
#     u1.save
#     render
#     rendered.should have_selector("active")
#     rendered.should have_css("active")
#   end  
# end

describe "users/show.html.haml" do

  # Fails with syntax error in users partial.
  it "should render Show and Back text" do
    render :template => "layouts/application.html.haml"
    render :partial => "users/show_follow.html.haml"
    rendered.should =~ /Following/
    rendered.should =~ /Followers/
  end
 
  it "should infer the controller path" do
    controller.request.path_parameters["controller"].should eq('users')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters["action"].should eq('show')
  end
 
  it "should display show users" do
    render :template => "layouts/application.html.haml"
    rendered.should =~ /Users/
  end
 
  it "should have correct <title> element " do
    render :template => "layouts/application.html.haml"
    rendered.should have_selector "title", 
      :content => "Statustar"
  end
end