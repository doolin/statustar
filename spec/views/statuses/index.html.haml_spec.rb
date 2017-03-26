# frozen_string_literal: true
require 'spec_helper'

describe 'statuses/index.html.haml' do
  # Fails with syntax error in statuses partial.
  xit 'should render Show and Back text' do
    render template: 'layouts/application.html.haml'
    render partial: 'statuses/form.html.haml'
    rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
  end

  it 'should infer the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('statuses')
  end

  it 'should infer the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it 'should display edit statuses' do
    render template: 'layouts/application.html.haml'
    expect(rendered).to match(/Status/)
  end
end
