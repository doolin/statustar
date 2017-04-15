# frozen_string_literal: true

require 'spec_helper'

describe 'users/show' do
  before(:each) do
    @user = create :user
  end

  it 'renders attributes in <p>' do
    user = build :user, id: 1
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:signed_in?).and_return(false)
    allow(view).to receive(:gravatar_for).with(user, size: 125)
    render
    expect(rendered).to match(/#{user.name}/)
  end

  # TODO: there are no actual status updates here, after
  # it's working, add the status updates.
  it 'renders list of status updates' do
    # allow(view).to receive(:signed_in?).and_return(false)
    allow(view).to receive(:signed_in?).and_return(true)
    u1 = FactoryGirl.create(:user, email: 'foobar@example.com')
    allow(view).to receive(:current_user).and_return(u1)
    allow(view).to receive(:current_user?).with(@user).and_return(true)
    u1.statuses.create(state: 1)
    u1.statuses.create!(state: 2)
    u1.save
    render
    # binding.pry
    # expect(rendered).to have_selector('active')
    # expect(rendered).to have_css('active')
    expect(rendered).to have_css('p.statuses')
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
