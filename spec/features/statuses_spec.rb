# frozen_string_literal: true

require 'spec_helper'

describe 'layouts/statuses' do
  before(:each) do
    integration_sign_in create(:user)
  end

  it 'renders head, title, body and container tags' do
    visit '/statuses'

    expect(page.body).to have_css 'nav'
    expect(page.body).to have_css 'body'
    expect(page.body).to have_selector('h1', text: 'Listing statuses')
  end

  describe 'creation' do
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
