# frozen_string_literal: true

require 'spec_helper'

describe 'statuses/edit.html.haml' do
  before do
    allow(view).to receive(:title).and_return('Blah')
    allow(view).to receive(:user_signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(create(:user))
    allow(view).to receive(:logo).and_return('logo')
  end

  it 'should render Show and Back text' do
    @status = assign(:status, Status.new(state: 1, user_id: 1))
    render
    expect(rendered).to match(/Busy/)
    expect(rendered).to match(/Maybe/)
    expect(rendered).to match(/Open/)
  end

  it 'should infer the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('statuses')
  end

  it 'should infer the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('edit')
  end

  it 'should display edit statuses' do
    render template: 'layouts/application.html.haml'
    expect(rendered).to match(/Status/)
  end
end
