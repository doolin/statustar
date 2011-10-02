require 'spec_helper'

describe "users/show.html.erb" do

  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    #rendered.should match(/Email/)
  end
  
  xit "renders list of microposts" do
    u1 = Factory(:user)
    u1.statuses.create({:state => 1})
    u1.statuses.create!({:state => 2})
    u1.microposts.create!({:content => 'micropost content'})
    u1.save
    render
    rendered.should have_selector("active")
    rendered.should have_css("active")
  end
  
  xit "renders list of status updates"
  
end
