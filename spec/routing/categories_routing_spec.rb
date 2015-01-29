require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories.json').to route_to('categories#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/categories/1.json').to route_to('categories#show', id: '1', format: 'json')
    end

    it 'routes to #create' do
      expect(post: '/categories.json').to route_to('categories#create', format: 'json')
    end

    it 'routes to #update' do
      expect(put: '/categories/1.json').to route_to('categories#update', id: '1', format: 'json')
    end

    it 'routes to #destroy' do
      expect(delete: '/categories/1.json').to route_to('categories#destroy', id: '1', format: 'json')
    end
  end
end
