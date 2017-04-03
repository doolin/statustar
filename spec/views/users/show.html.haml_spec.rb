# frozen_string_literal: true
require 'spec_helper'

describe 'users/show' do
  before(:each) do
    @user = create :user
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end

  xit 'renders list of status updates' do
    u1 = FactoryGirl.create(:user)
    u1.statuses.create(state: 1)
    u1.statuses.create!(state: 2)
    u1.save
    render
    rendered.should have_selector('active')
    rendered.should have_css('active')
  end

  # Fails with syntax error in users/show_follow partial.
  xit 'should render Show and Back text' do
    render template: 'layouts/application'
    render template: 'users/show_follow'
    rendered.should =~ /Following/
    rendered.should =~ /Followers/
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('users')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  # Need to get signed in correctly to get the correct view
  xit 'should display show users' do
    render template: 'layouts/application'
    rendered.should =~ /Users/
  end

  xit 'should have correct <title> element ' do
    render template: 'layouts/application'
    rendered.should have_selector 'title', text: 'Statustar'
  end
end
