# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersHelper do
  describe '#gravatar_for' do
    it 'acquires a gravatar for user' do
      user = build :user
      expect(helper).to receive(:gravatar_image_tag)
      helper.gravatar_for(user, size: 50)
    end
  end
end
