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

  xit 'should render tags' do
    rendered.should have_selector 'p'
    rendered.should have_selector 'b'
    rendered.should have_selector 'span', id: 'busy'
    rendered.should have_selector 'span', id: 'maybe'
    rendered.should have_selector 'span', id: 'open'
    rendered.should have_selector 'span', id: 'busy1'
    rendered.should have_selector 'span', id: 'busy2'
  end

  xit 'displays all the statuses' do
    assign(:statuses, [
             double(Status, name: 'Busy'),
             double(Status, name: 'Maybe'),
             double(Status, name: 'Open')
           ])
    render
    rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
  end
end
