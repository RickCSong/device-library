require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users.json').to route_to('users#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/users/1.json').to route_to('users#show', id: '1', format: 'json')
    end
  end
end
