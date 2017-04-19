# frozen_string_literal: true

require 'spec_helper'

describe 'layouts/statuses' do
  it 'renders head, title, body and container tags' do
    visit '/statuses'

    expect(page.body).to have_css 'nav'
    expect(page.body).to have_css 'body'
    expect(page.body).to have_selector('h1', text: 'Listing statuses')
  end

  # TODO: see if integration signin will work here.
  before(:each) do
    user = create :user
    visit signin_path
    fill_in :session_email,    with: user.email
    fill_in :session_password, with: user.password
    click_button
  end

  describe 'creation' do
    context 'failure' do
      it 'does not make a new status' do
        expect do
          visit root_path
          choose('Busy')
          # binding.pry
          # expect(page.body).to have_selector("div#error_explanation")
        end.to_not change(Status, :count)
      end
    end

    context 'success' do
      xit 'makes a new status' do
        expect do
          visit root_path
          choose('Busy')
          expect(page.body).to have_selector('title', text: 'Statustar | Home', visible: false)
        end.to change(Status, :count).by(1)
      end
    end
  end
end
