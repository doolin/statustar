# frozen_string_literal: true
require 'spec_helper'

describe 'shared/_feed_item' do
  it 'should infer the controller path' do
    controller.request.path_parameters[:controller].should eq('shared')
  end
end
