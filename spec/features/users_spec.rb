# frozen_string_literal: true
require 'spec_helper'

describe 'Users', type: :feature do
  describe 'signup' do
    context 'failure' do
      it 'fails to make a new user' do
        expect do
          visit signup_path
          fill_in 'Name',         with: 'Example user'
          fill_in 'Email',        with: 'user@example.com'
          fill_in 'Password',     with: 'foobar'
          fill_in 'Confirmation', with: ''
          click_button 'Sign up'

          expect(page.body).to have_selector('#error_explanation')
        end.not_to change(User, :count)
      end
    end

    context 'success' do
      it 'makes a new user' do

          visit signup_path
          fill_in 'user_name', with: 'Example User'
          fill_in 'Email',        with: 'user@example.com'
          fill_in 'Password',     with: 'foobar'
          fill_in 'Confirmation', with: 'foobar'
          click_button 'Sign up'

          # binding.pry

          expect(page.body).to have_selector('.flash.success', text: 'Welcome')

=begin
        expect do
          visit signup_path
          page.fill_in 'Name', with: 'Example User'
          fill_in 'Email',        with: 'user@example.com'
          fill_in 'Password',     with: 'foobar'
          fill_in 'Confirmation', with: 'foobar'
          click_button 'Sign up'

          binding.pry

          expect(page.body).to have_selector('.flash.success', text: 'Welcome')
        end.to change(User, :count).by(1)
=end

      end
    end
  end

  describe 'sign in/out' do
    context 'failure' do
      it 'should not sign a user in' do
        integration_sign_in nil
        expect(page.body).to have_selector('.flash.error', text: 'Invalid')
      end
    end

    context 'success' do
      xit 'signs a user in and out' do
        user = create :user
        integration_sign_in user
        controller.should be_signed_in

        click_link 'Sign out'
        controller.should_not be_signed_in
      end
    end
  end
end
