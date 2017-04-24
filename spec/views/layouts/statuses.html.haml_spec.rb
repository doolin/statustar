# frozen_string_literal: true

require 'spec_helper'

describe 'layouts/statuses' do
  it 'displays all the statuses' do
    assign(:statuses, [
             double(Status, name: 'busy'),
             double(Status, name: 'maybe'),
             double(Status, name: 'open')
           ])
    render
    expect(rendered).to match(/busy/)
    expect(rendered).to match(/maybe/)
    expect(rendered).to match(/open/)
  end
end
