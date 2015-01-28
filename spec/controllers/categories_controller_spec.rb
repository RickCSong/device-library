require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET index' do
    let!(:categories) { create_list :category, 10 }

    before do
      xhr :get, :index, format: :json
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'responds with content-type: application/json' do
      expect(response.content_type).to eql('application/json')
    end

    it 'responds with all categories serialized by CategorySerializer' do
      expected = categories.map { |p| CategorySerializer.new(p).serializable_hash }.to_json
      expect(response.body).to include(expected)
    end
  end

  describe 'GET show' do
    let!(:category) { create :category }

    before do
      xhr :get, :show, id: category.id, format: :json
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'responds with content-type: application/json' do
      expect(response.content_type).to eql('application/json')
    end

    it 'responds with the category serialized by CategorySerializer' do
      expect(response.body).to eql(CategorySerializer.new(category).to_json)
    end
  end

  describe 'POST create' do
    before do
      xhr :post, :create, category: category_params, format: :json
    end

    context 'valid params' do
      let(:category_params) do
        {
          name: 'Test category',
          code: 'MX1',
        }
      end

      it 'responds with success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with content-type: application/json' do
        expect(response.content_type).to eql('application/json')
      end

      it 'responds with the category serialized by CategorySerializer' do
        category = Category.first
        expect(response.body).to eql(CategorySerializer.new(category).to_json)
      end
    end

    context 'invalid params' do
      let(:category_params) do
        {
          name: '',
          code: 'MX1',
        }
      end

      it 'responds with unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'responds with content-type: application/json' do
        expect(response.content_type).to eql('application/json')
      end

      it 'does not create a new category' do
        expect(Category.count).to eql(0)
      end

      it 'expects error body to contain error' do
        expect(response.body).to include('errors')
      end
    end
  end

  describe 'PATCH update' do
    let!(:category) { create :category, name: 'Original name' }

    before do
      xhr :patch, :update, id: category.id, category: category_params, format: :json
    end

    context 'valid params' do
      let(:category_params) do
        {name: 'New name'}
      end

      it 'responds with success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with content-type: application/json' do
        expect(response.content_type).to eql('application/json')
      end

      it 'responds with the updated category' do
        expect(response.body).to eql(CategorySerializer.new(category.reload).to_json)
      end
    end

    context 'invalid params' do
      let(:category_params) do
        {name: ''}
      end

      it 'responds with unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'responds with content-type: application/json' do
        expect(response.content_type).to eql('application/json')
      end

      it 'has the old name' do
        category = Category.first
        expect(category.name).to eql('Original name')
      end

      it 'expects error body to contain error' do
        expect(response.body).to include('errors')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:category) { create :category }

    before do
      xhr :delete, :destroy, id: category.id, format: :json
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'responds with content-type: application/json' do
      expect(response.content_type).to eql('application/json')
    end

    it 'responds with an empty string' do
      expect(response.body).to eql(CategorySerializer.new(category).to_json)
    end

    it 'deletes the category' do
      expect(Category.count).to eql(0)
    end
  end
end
