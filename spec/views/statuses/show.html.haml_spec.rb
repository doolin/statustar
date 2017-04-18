# frozen_string_literal: true

require 'spec_helper'

describe 'statuses/show' do
  before(:each) do
    @status = Status.new state: 1, user_id: 1, id: 1
    allow(@status).to receive(:id).and_return(1)
    render
  end

  it 'displays all statuses' do
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
  end

  it 'renders tags' do
    expect(rendered).to have_selector 'p'
    expect(rendered).to have_selector 'b'
    expect(rendered).to have_selector 'span', id: 'busy'
    expect(rendered).to have_selector 'span', id: 'maybe'
    expect(rendered).to have_selector 'span', id: 'open'
    expect(rendered).to have_selector 'span', id: 'busy1'
    expect(rendered).to have_selector 'span', id: 'busy2'
  end

  it 'displays all the statuses' do
    assign(:statuses, [
             double(Status, name: 'Busy'),
             double(Status, name: 'Maybe'),
             double(Status, name: 'Open')
           ])
    render
    expect(rendered).to match(/★</)
    # TODO: figure out some way of testing these gadgets,
    # just for fun.
    # expect(rendered).to match(/☆ /)
    # expect(rendered).to match(/☆/)
  end
end
