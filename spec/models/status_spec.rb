# frozen_string_literal: true

require 'spec_helper'

describe Status do
  before(:each) do
    @user = create(:user)
    @attr = { state: 1 }
  end

  it 'creates a new instance given valid attributes' do
    @user.statuses.create!(@attr)
  end

  describe 'user associations' do
    before(:each) do
      @status = @user.statuses.create(@attr)
    end

    it 'has a user attribute' do
      expect(@status).to respond_to(:user)
    end

    it 'has the right associated user' do
      expect(@status.user).to eq @user
    end
  end

  describe 'validations' do
    it 'requires a user id' do
      expect(Status.new(@attr)).not_to be_valid
    end

    it 'requires nonblank content' do
      expect(@user.statuses.build(state: '  ')).not_to be_valid
    end

    it 'rejects long content' do
      expect(@user.statuses.build(state: 'a' * 141)).not_to be_valid
    end
  end

  it 'returns the correct state' do
    status = Status.new(state: 1)
    expect(status.find_active(1)).to eq 'active'
  end

  it 'returns inactive correctly' do
    status = Status.new(state: 2)
    expect(status.find_active(1)).to eq('inactive')
  end

  describe 'from_users_followed_by' do
    before(:each) do
      @other_user = create(:user, email: generate(:email))
      @third_user = create(:user, email: generate(:email))

      @user_post = @user.statuses.create!(state: 1)
      @other_post = @other_user.statuses.create!(state: 3)
      @third_post = @third_user.statuses.create!(state: 2)

      @user.follow!(@other_user)
    end

    it 'has a from_users_followed_by class method' do
      expect(Status).to respond_to(:from_users_followed_by)
    end

    it "includes the followed user's statuses" do
      expect(Status.from_users_followed_by(@user)).to include(@other_post)
    end

    it "includes the user's own statuses" do
      expect(Status.from_users_followed_by(@user)).to include(@user_post)
    end

    it "does not include an unfollowed user's statuses" do
      expect(Status.from_users_followed_by(@user)).not_to include(@third_post)
    end
  end
end
