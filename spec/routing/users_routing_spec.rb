# frozen_string_literal: true

require 'spec_helper'

describe UsersController do
  describe 'routing' do
    it 'recognizes and generates #index' do
      expect(get: '/users').to route_to(controller: 'users', action: 'index')
    end

    it 'recognizes and generates #new' do
      expect(get: '/users/new').to route_to(controller: 'users', action: 'new')
    end

    it 'recognizes and generates #show' do
      expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
    end

    it 'recognizes and generates #edit' do
      expect(get: '/users/1/edit').to route_to(controller: 'users', action: 'edit', id: '1')
    end

    it 'recognizes and generates #create' do
      expect(post: '/users').to route_to(controller: 'users', action: 'create')
    end

    it 'recognizes and generates #update' do
      expect(put: '/users/1').to route_to(controller: 'users', action: 'update', id: '1')
    end

    it 'recognizes and generates #destroy' do
      expect(delete: '/users/1').to route_to(controller: 'users', action: 'destroy', id: '1')
    end
  end
end
