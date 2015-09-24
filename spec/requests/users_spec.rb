require 'spec_helper'

# This should go into the model spec

describe "Users" do
  describe "admin attribute" do
    before(:each) do
      # Using only "@user = User.create!(@attr)" as per the tutorial
      # causes validation errors so I added the @attr definition
      @attr = { name: "New User", email: "user@example.com",
                password: "foobar", password_confirmation: "foobar" }
      @user = User.create!(@attr)
    end

    it "should respond to admin" do
      @user.should respond_to(:admin)
    end

    it "should not be an admin by default" do
      @user.should_not be_admin
    end

    it "should be convertible to an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end
end
