# frozen_string_literal: true
require 'spec_helper'

describe 'Users' do
  describe 'signup' do
    describe 'failure' do
      it 'should not make a new user' do
        lambda do
          visit signup_path
          fill_in 'Name',         with: 'Example user'
          fill_in 'Email',        with: 'user@example.com'
          fill_in 'Password',     with: 'foobar'
          fill_in 'Confirmation', with: ''
          click_button 'Sign up'

          expect(page.body).to have_selector('#error_explanation')
        end.should_not change(User, :count)
      end
    end

    describe 'success' do
      it 'should make a new user' do
        lambda do
          visit signup_path
          fill_in 'Name',         with: 'Example User'
          fill_in 'Email',        with: 'user@example.com'
          fill_in 'Password',     with: 'foobar'
          fill_in 'Confirmation', with: 'foobar'
          click_button 'Sign up'

          expect(page.body).to have_selector('.flash.success', text: 'Welcome')
        end.should change(User, :count).by(1)
      end
    end
  end

  describe 'sign in/out' do
    describe 'failure' do
      it 'should not sign a user in' do
        integration_sign_in nil
        expect(page.body).to have_selector('.flash.error', text: 'Invalid')
      end
    end

    describe 'success' do
      xit 'should sign a user in and out' do
        user = FactoryGirl.create(:user)
        integration_sign_in user
        controller.should be_signed_in

        click_link 'Sign out'
        controller.should_not be_signed_in
      end
    end
  end
end
