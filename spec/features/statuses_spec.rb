# frozen_string_literal: true
require 'spec_helper'

describe 'layouts/statuses' do # , type: :feature do
  xit 'should render head, title, body and container tags' do
    visit '/statuses'

    expect(page.body).to have_css 'nav'
    expect(page.body).to have_css 'body'
    # This doesn't work because there are no statuses yet.
    # expect(page.body).to have_css "container"
  end

  before(:each) do
    user = create :user
    visit signin_path
    # binding.pry
    fill_in :session_email,    with: user.email
    fill_in :session_password, with: user.password
    click_button
  end

  describe 'creation' do
    context 'failure' do
      xit 'does not make a new status' do
        expect do
          visit root_path
          choose('Busy')
          click_button 'Create Status'
          # response.should render_template('pages/home')
          # expect(response).to render_template('pages/home')
          # response.should have_selector("div#error_explanation")
        end.to_not change(Status, :count)
      end
    end

    context 'success' do
      xit 'should make a new status' do
        _content = 'Lorem ipsum dolor sit amet'
        lambda do
          visit root_path
          choose('Busy')
          click_button 'Create Status'
        end.should change(Status, :count).by(1)
      end
    end
  end
end
