require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = User.new name: 'My Name', email: 'myname@example.com'
    @user.stub(:id).and_return(1)
  end

  it "renders the edit user form" do
    render

    assert_select "form", :action => user_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_email", :name => "user[email]"
    end
  end
end
