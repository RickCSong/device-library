require 'rails_helper'

RSpec.describe ActivitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/activities.json').to route_to('activities#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/activities/1.json').to route_to('activities#show', id: '1', format: 'json')
    end
  end
end
