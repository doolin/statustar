# frozen_string_literal: true
require 'spec_helper'

# TODO: This should go into the model spec?

describe 'Users' do
  describe 'admin attribute' do
    let(:user) { create :user }

    it 'responds to admin' do
      expect(user).to respond_to(:admin)
    end

    it 'is not an admin by default' do
      expect(user).not_to be_admin
    end

    it 'is convertible to an admin' do
      user.toggle!(:admin)
      expect(user).to be_admin
    end
  end
end
