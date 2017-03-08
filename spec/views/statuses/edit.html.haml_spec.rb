# frozen_string_literal: true
require 'spec_helper'

describe 'statuses/edit.html.haml' do

  # Fails with syntax error in statuses partial.
  xit 'should render Show and Back text' do
    render template: 'layouts/application.html.haml'
    render partial: 'statuses/form.html.haml'
    rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
  end

  it 'should infer the controller path' do
    controller.request.path_parameters[:controller].should eq('statuses')
  end

  it 'should infer the controller action' do
    controller.request.path_parameters[:action].should eq('edit')
  end

  it 'should display edit statuses' do
    render template: 'layouts/application.html.haml'
    rendered.should =~ /Status/
  end
end
