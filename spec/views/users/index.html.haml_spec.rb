# frozen_string_literal: true
require 'spec_helper'

describe 'users/index.html.haml' do
  before(:each) do
    assign(:users, [
             stub_model(User,
               name: 'Name',
               email: 'Email'),
             stub_model(User,
               name: 'Name',
               email: 'Email')
           ])
  end

  xit 'renders a list of users' do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
  end
end
