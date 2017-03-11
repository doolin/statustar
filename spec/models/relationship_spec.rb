# frozen_string_literal: true
require 'spec_helper'

describe Relationship do
  before(:each) do
    @follower = create(:user)
    @followed = create(:user, email: generate(:email))
    @relationship = @follower.relationships.build(followed_id: @followed.id)
  end

  it 'creates a new instance given valid attributes' do
    @relationship.save!
  end

  describe 'follow methods' do
    before(:each) do
      @relationship.save
    end

    it 'has a follower attribute' do
      @relationship.should respond_to(:follower)
    end

    it 'has the right follower' do
      @relationship.follower.should == @follower
    end

    it 'has a followed attribute' do
      @relationship.should respond_to(:followed)
    end

    it 'has the right followed user' do
      @relationship.followed.should == @followed
    end
  end

  describe 'validations' do
    it 'requires a follower_id' do
      @relationship.follower_id = nil
      @relationship.should_not be_valid
    end

    it 'requires a followed_id' do
      @relationship.followed_id = nil
      @relationship.should_not be_valid
    end
  end

  describe 'relationships' do
    before(:each) do
      @attr = {
        name: 'Example User',
        email: 'user@example.com',
        password: 'foobar',
        password_confirmation: 'foobar'
      }

      @user = User.create!(@attr)
      @followed = create(:user, email: generate(:email))
    end

    it 'has a relationships method' do
      @user.should respond_to(:relationships)
    end

    it 'has a following method' do
      @user.should respond_to(:following)
    end

    it 'has a following? method' do
      @user.should respond_to(:following?)
    end

    it 'has a follow! method' do
      @user.should respond_to(:follow!)
    end

    it 'follows another user' do
      @user.follow!(@followed)
      @user.should be_following(@followed)
    end

    it 'includes the followed user in the following array' do
      @user.follow!(@followed)
      @user.following.should include(@followed)
    end

    it 'has an unfollow! method' do
      @followed.should respond_to(:unfollow!)
    end

    it 'unfollows a user' do
      @user.follow!(@followed)
      @user.unfollow!(@followed)
      @user.should_not be_following(@followed)
    end

    it 'has a reverse_relationships method' do
      @user.should respond_to(:reverse_relationships)
    end

    it 'has a followers method' do
      @user.should respond_to(:followers)
    end

    it 'includes the follower in the followers array' do
      @user.follow!(@followed)
      @followed.followers.should include(@user)
    end
  end
end
