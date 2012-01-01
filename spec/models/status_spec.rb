require 'spec_helper'

describe Status do

  before(:each) do
    @user = Factory(:user)
    @attr = { :state => 1 }
  end

  # TODO: Write up a little blog post on how
  # the error returned by     @user.status.create!(@attr)
  it "should create a new instance given valid attributes" do
    @user.statuses.create!(@attr)
  end

  describe "user associations" do
    
    before(:each) do
      @status = @user.statuses.create(@attr)
    end

    it "should have a user attribute" do
      @status.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @status.user_id.should == @user.id
      @status.user.should == @user
    end
  end

  describe "validations" do

    it "should require a user id" do
      Status.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.statuses.build(:state => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.statuses.build(:state => "a" * 141).should_not be_valid
    end
  end

  it "should return the correct state" do
    status = Status.new(:state => 1)
    status.find_active(1).should eq("active")
  end
  
  it "should return inactive correctly" do
    status = Status.new(:state =>2)
    status.find_active(1).should eq("inactive")
  end

  describe "from_users_followed_by" do

    before(:each) do
      @other_user = Factory(:user, :email => Factory.next(:email))
      @third_user = Factory(:user, :email => Factory.next(:email))

      @user_post = @user.statuses.create!(:state => 1)
      @other_post = @other_user.statuses.create!(:state => 3)
      @third_post = @third_user.statuses.create!(:state => 2)

      @user.follow!(@other_user)
    end

    it "should have a from_users_followed_by class method" do
      Status.should respond_to(:from_users_followed_by)
    end

    it "should include the followed user's statuses" do
      Status.from_users_followed_by(@user).should include(@other_post)
    end

    it "should include the user's own statuses" do
      Status.from_users_followed_by(@user).should include(@user_post)
    end

    it "should not include an unfollowed user's statuses" do
      Status.from_users_followed_by(@user).should_not include(@third_post)
    end

  end

end
