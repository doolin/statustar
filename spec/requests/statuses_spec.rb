# frozen_string_literal: true
require 'spec_helper'

describe 'Statuses' do
  before(:each) do
    user = FactoryGirl.create(:user)
    visit signin_path
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button
  end

  describe 'creation' do
    describe 'failure' do
      xit 'should not make a new status' do
        expect do
          visit root_path
          choose('Busy')
          click_button 'Create Status'
          #response.should render_template('pages/home')
          #response.should have_selector("div#error_explanation")
        end.to_not change(Status, :count)
      end
    end

    describe 'success' do
      xit 'should make a new status' do
        content = 'Lorem ipsum dolor sit amet'
        lambda do
          visit root_path
          choose('Busy')
          click_button 'Create Status'
        end.should change(Status, :count).by(1)
      end
    end
  end
end
