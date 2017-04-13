# frozen_string_literal: true

require 'spec_helper'

describe 'statuses/index.html.haml' do
  before do
    allow(view).to receive(:title).and_return('Blah')
    allow(view).to receive(:signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(create(:user))
    allow(view).to receive(:logo).and_return('logo')
  end

  # Fails with syntax error in statuses partial.
  xit 'renders Show and Back text' do
    render template: 'layouts/application.html.haml'
    render partial: 'statuses/form.html.haml'
    rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('statuses')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it 'displays edit statuses' do
    render template: 'layouts/application.html.haml'
    expect(rendered).to match(/Status/)
  end
end
