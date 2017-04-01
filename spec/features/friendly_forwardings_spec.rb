# frozen_string_literal: true
require 'spec_helper'

describe 'FriendlyForwardings', type: :feature do
  it 'forwards to the requested page after signin' do
    user = create :user
    visit edit_user_path(user)
    fill_in :session_email,    with: user.email
    fill_in :session_password, with: user.password
    click_button 'Sign in'

    expect(page.body).to match(/Edit/)
  end
end
