require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'iPhone',
      code: 'xIP'
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      code: ''
    }
  end

  describe 'GET index' do
    it 'assigns all categories as @categories' do
      categories = create_list :category, 10
      xhr :get, :index, {}
      expect(assigns(:categories)).to eq(categories)
    end
  end

  describe 'GET show' do
    it 'assigns the requested category as @category' do
      category = create :category
      xhr :get, :show, {id: category.to_param}
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Category' do
        expect {
          xhr :post, :create, {category: valid_attributes}
        }.to change(Category, :count).by(1)
        expect(response).to have_http_status(:created)
      end

      it 'assigns a newly created category as @category' do
        xhr :post, :create, {category: valid_attributes}
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end
    end

    describe 'with invalid params' do
      it 'does not create a new Category' do
        expect {
          xhr :post, :create, {category: invalid_attributes}
        }.to_not change(Category, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'assigns a newly created but unsaved category as @category' do
        xhr :post, :create, {category: invalid_attributes}
        expect(assigns(:category)).to be_a_new(Category)
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        {
          name: 'Android'
        }
      end

      it 'updates the requested category' do
        category = create :category
        xhr :put, :update, {id: category.to_param, category: new_attributes}
        category.reload
        expect(category.name).to eql('Android')
      end

      it 'returns no content' do
        category = create :category
        xhr :put, :update, {id: category.to_param, category: new_attributes}
        expect(response).to have_http_status(:no_content)
        expect(response.body).to be_blank
      end
    end

    describe 'with invalid params' do
      it 'assigns the category as @category' do
        category = create :category
        xhr :put, :update, {id: category.to_param, category: invalid_attributes}
        expect(assigns(:category)).to eq(category)
      end

      it 'returns a hash of errors' do
        category = create :category
        xhr :put, :update, {id: category.to_param, category: invalid_attributes}
        expect(response.body).to eql({errors: assigns(:category).errors}.to_json)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested category' do
      category = create :category
      expect {
        xhr :delete, :destroy, {id: category.to_param}
      }.to change(Category, :count).by(-1)
    end

    it 'returns no content' do
      category = create :category
      xhr :delete, :destroy, {id: category.to_param}
      expect(response).to have_http_status(:no_content)
      expect(response.body).to be_blank
    end
  end
end
