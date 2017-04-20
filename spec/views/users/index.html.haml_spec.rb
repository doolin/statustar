# frozen_string_literal: true

require 'spec_helper'

describe 'users/index.html.haml' do
  let(:user1) { create :user }
  let(:user2) { create :user, email: 'foo@example.com' }

  before(:each) do
    users = [user1, user2]
    allow(users).to receive(:total_pages).and_return(1)
    assign(:users, users)
  end

  it 'renders a list of users' do
    allow(view).to receive(:current_user).and_return(user1)
    render
    expect(rendered).to have_selector('li>a', count: 2) # , text: 'Michael Hartl')
  end
end
