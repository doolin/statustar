# frozen_string_literal: true

require 'spec_helper'

describe 'users/new' do
  before(:each) do
    @user = User.new
  end

  it 'renders new user form' do
    render
    assert_select 'form', action: users_path, method: 'post' do
      assert_select 'input#user_username', name: 'user[username]'
      assert_select 'input#user_email', name: 'user[email]'
    end
  end
end
