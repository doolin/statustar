# frozen_string_literal: true
require 'spec_helper'

# TODO: develop these specs along with the statuses_controller_spec

describe 'Statuses' do
  let(:status) { create :status }

  describe 'creation' do
    it 'does not make a new status' do
      get status_path(status)
      expect(response).to render_template('statuses/show')
    end
  end
end
