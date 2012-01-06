require 'spec_helper'

describe "users/show.html.haml" do

  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    #rendered.should match(/Email/)
  end
  
  
  xit "renders list of status updates"do
    u1 = Factory(:user)
    u1.statuses.create({:state => 1})
    u1.statuses.create!({:state => 2})
    u1.save
    render
    rendered.should have_selector("active")
    rendered.should have_css("active")
  end
  
end
