# frozen_string_literal: true
require 'spec_helper'

# TODO: This should go into the model spec?

describe 'Users' do
  describe 'admin attribute' do
    let(:user) { create :user }

    it 'responds to admin' do
      user.should respond_to(:admin)
    end

    it 'is not an admin by default' do
      user.should_not be_admin
    end

    it 'is convertible to an admin' do
      user.toggle!(:admin)
      user.should be_admin
    end
  end
end
