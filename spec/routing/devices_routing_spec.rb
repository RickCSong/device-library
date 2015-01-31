require 'rails_helper'

RSpec.describe DevicesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/devices.json').to route_to('devices#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/devices/1.json').to route_to('devices#show', id: '1', format: 'json')
    end

    it 'routes to #create' do
      expect(post: '/devices.json').to route_to('devices#create', format: 'json')
    end

    it 'routes to #update' do
      expect(put: '/devices/1.json').to route_to('devices#update', id: '1', format: 'json')
    end

    it 'routes to #destroy' do
      expect(delete: '/devices/1.json').to route_to('devices#destroy', id: '1', format: 'json')
    end

    it 'routes to #checkout' do
      expect(post: '/devices/checkout.json').to route_to('devices#checkout', format: 'json')
    end

    it 'routes to #return' do
      expect(post: '/devices/return.json').to route_to('devices#return', format: 'json')
    end
  end
end
