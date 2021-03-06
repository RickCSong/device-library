require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'iPhone',
      code: 'xIP',
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      code: '',
    }
  end

  let(:admin) { create :user, :admin }

  before do
    fake_sso_login(admin)
  end

  describe 'GET index' do
    include_context 'logged in with user permissions'

    it 'assigns all categories as @categories' do
      categories = create_list :category, 10
      xhr :get, :index, {}
      expect(assigns(:categories)).to eq(categories)
    end

    it 'renders the index template' do
      xhr :get, :index, {}
      is_expected.to render_template('index')
    end
  end

  describe 'GET show' do
    include_context 'logged in with user permissions'

    let(:category) { create :category }

    it 'assigns the requested category as @category' do
      xhr :get, :show, id: category.to_param
      expect(assigns(:category)).to eq(category)
    end

    it 'renders the show template' do
      xhr :get, :show, id: category.to_param
      is_expected.to render_template('show')
    end
  end

  describe 'POST create' do
    context 'as user' do
      include_context 'logged in with user permissions'

      it 'responds with forbidden error' do
        xhr :post, :create, device: valid_attributes
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eql({errors: {user: ['must be an admin to perform this']}}.to_json)
      end
    end

    context 'as admin' do
      include_context 'logged in with admin permissions'
      context 'with valid params' do
        it 'creates a new Category' do
          expect {
            xhr :post, :create, category: valid_attributes
          }.to change(Category, :count).by(1)
          expect(response).to have_http_status(:created)
        end

        it 'assigns a newly created category as @category' do
          xhr :post, :create, category: valid_attributes
          expect(assigns(:category)).to be_a(Category)
          expect(assigns(:category)).to be_persisted
        end
      end

      context 'with invalid params' do
        it 'does not create a new Category' do
          expect {
            xhr :post, :create, category: invalid_attributes
          }.to_not change(Category, :count)
        end

        it 'assigns a newly created but unsaved category as @category' do
          xhr :post, :create, category: invalid_attributes
          expect(assigns(:category)).to be_a_new(Category)
        end

        it 'renders the show template' do
          xhr :post, :create, category: valid_attributes
          expect(response).to have_http_status(:created)
          is_expected.to render_template('show')
        end
      end
    end
  end

  describe 'PUT update' do
    context 'as user' do
      include_context 'logged in with user permissions'

      it 'responds with forbidden error' do
        xhr :post, :create, device: valid_attributes
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eql({errors: {user: ['must be an admin to perform this']}}.to_json)
      end
    end

    context 'as admin' do
      include_context 'logged in with admin permissions'
      context 'with valid params' do
        let(:new_attributes) do
          {
            name: 'Android',
          }
        end

        it 'updates the requested category' do
          category = create :category
          xhr :put, :update, id: category.to_param, category: new_attributes
          category.reload
          expect(category.name).to eql('Android')
        end

        it 'returns no content' do
          category = create :category
          xhr :put, :update, id: category.to_param, category: new_attributes
          expect(response).to have_http_status(:no_content)
          expect(response.body).to be_blank
        end
      end

      context 'with invalid params' do
        it 'assigns the category as @category' do
          category = create :category
          xhr :put, :update, id: category.to_param, category: invalid_attributes
          expect(assigns(:category)).to eq(category)
        end

        it 'returns a hash of errors' do
          category = create :category
          xhr :put, :update, id: category.to_param, category: invalid_attributes
          expect(response.body).to eql({errors: assigns(:category).errors}.to_json)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    context 'as user' do
      include_context 'logged in with user permissions'

      it 'responds with forbidden error' do
        xhr :post, :create, device: valid_attributes
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eql({errors: {user: ['must be an admin to perform this']}}.to_json)
      end
    end

    context 'as admin' do
      include_context 'logged in with admin permissions'
      it 'destroys the requested category' do
        category = create :category
        expect {
          xhr :delete, :destroy, id: category.to_param
        }.to change(Category, :count).by(-1)
      end

      it 'returns no content' do
        category = create :category
        xhr :delete, :destroy, id: category.to_param
        expect(response).to have_http_status(:no_content)
        expect(response.body).to be_blank
      end
    end
  end
end
