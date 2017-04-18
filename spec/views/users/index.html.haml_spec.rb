# frozen_string_literal: true

require 'spec_helper'

describe 'users/index.html.haml' do
  before(:each) do
=begin
    assign(:users, [
             stub_model(User,
                        name: 'Name',
                        email: 'Email'),
             stub_model(User,
                        name: 'Name',
                        email: 'Email')
           ])
=end

    @users = [
      create(:user),
      create(:user, email: 'foo@example.com')
    ]
  end

  xit 'renders a list of users' do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    # assert_select 'tr>td', text: 'Name'.to_s, count: 2
    expect(view).to have_selector('tr>td', text: 'Name'.to_s, count: 2)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    # assert_select 'tr>td', text: 'Email'.to_s, count: 2
    expect(view).to have_selector('tr>td', text: 'Email'.to_s, count: 2)
  end
end
