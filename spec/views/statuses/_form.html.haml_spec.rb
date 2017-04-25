# frozen_string_literal: true

require 'spec_helper'

describe 'statuses/_form.html.haml' do
  before(:each) do
    @status = assign(:status, Status.new(state: 1, user_id: 1))
    allow(view).to receive(:title)
    allow(view).to receive(:signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(User.new)
    render
  end

  it 'renders field and action tags' do
    expect(rendered).to have_selector 'div', class: 'field'
    expect(rendered).to have_selector 'div', class: 'actions'
  end

  it 'displays all the statuses' do
    assign(:statuses, [
             Status.new(state: 'Busy'),
             Status.new(state: 'Maybe'),
             Status.new(state: 'Open')
           ])

    expect(rendered).to match(/Busy/)
    expect(rendered).to match(/Maybe/)
    expect(rendered).to match(/Open/)
  end
end
