require 'rails_helper'

RSpec.describe StaticController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('static#index')
    end

    it 'routes all other HTML requests to static#index' do
      expect(get: '/non-existant-route').to route_to('static#index', path: 'non-existant-route')
    end
  end
end
