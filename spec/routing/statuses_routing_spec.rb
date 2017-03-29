# frozen_string_literal: true
require 'spec_helper'

describe StatusesController do
  describe 'routing' do
    it 'recognizes and generates #index' do
      expect(get: '/statuses').to route_to(controller: 'statuses', action: 'index')
    end

    it 'recognizes and generates #new' do
      expect(get: '/statuses/new').to route_to(controller: 'statuses', action: 'new')
    end

    it 'recognizes and generates #show' do
      expect(get: '/statuses/1').to route_to(controller: 'statuses', action: 'show', id: '1')
    end

    it 'recognizes and generates #edit' do
      expect(get: '/statuses/1/edit').to route_to(controller: 'statuses', action: 'edit', id: '1')
    end

    it 'recognizes and generates #update' do
       expect(put: '/statuses/1').to route_to(controller: 'statuses', action: 'update', id: '1')
    end

    it 'recognizes and generates #create' do
      expect(post: '/statuses').to route_to(controller: 'statuses', action: 'create')
    end

    it 'recognizes and generates #destroy' do
      expect(delete: '/statuses/1').to route_to(controller: 'statuses', action: 'destroy', id: '1')
    end
  end
end
