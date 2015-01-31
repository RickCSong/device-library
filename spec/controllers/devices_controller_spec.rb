require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  let(:valid_attributes) do
    category = create :category
    {
      category_id: category.id,
      hardware: 'iPhone 6s',
      operating_system: 'iOS 7.1',
      storage_code: '0001',
      barcode: "#{category.code}0001",
      status: 'available',
      details: 'Random details regarding the device',
    }
  end

  let(:invalid_attributes) do
    {
      operating_system: 'iOS 7.1',
      hardware: 'iPhone 6s',
      storage_code: '0001',
      barcode: '',
      status: 'available',
      details: 'Random details regarding the device',
    }
  end

  describe 'GET index' do
    include_context 'logged in with user permissions'

    it 'assigns all devices as @devices' do
      devices = create_list :device, 10
      xhr :get, :index, {}
      expect(assigns(:devices)).to eq(devices)
    end

    it 'renders the index template' do
      xhr :get, :index, {}
      is_expected.to render_template('index')
    end
  end

  describe 'GET show' do
    include_context 'logged in with user permissions'

    let(:device) { create :device }

    it 'assigns the requested device as @device' do
      xhr :get, :show, id: device.to_param
      expect(assigns(:device)).to eq(device)
    end

    it 'renders the show template' do
      xhr :get, :show, id: device.to_param
      is_expected.to render_template('show')
    end
  end

  describe 'POST create' do
    context 'as user' do
      include_context 'logged in with user permissions'

      it 'responds with forbidden error' do
        xhr :post, :create, device: valid_attributes
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eql({errors: {role: ['must be an admin to perform this']}}.to_json)
      end
    end

    context 'as admin' do
      include_context 'logged in with admin permissions'

      context 'with valid params' do
        it 'creates a new Device' do
          expect {
            xhr :post, :create, device: valid_attributes
          }.to change(Device, :count).by(1)
        end

        it 'assigns a newly created device as @device' do
          xhr :post, :create, device: valid_attributes
          expect(assigns(:device)).to be_a(Device)
          expect(assigns(:device)).to be_persisted
        end

        it 'renders the show template' do
          xhr :post, :create, device: valid_attributes
          expect(response).to have_http_status(:created)
          is_expected.to render_template('show')
        end
      end

      context 'with invalid params' do
        it 'does not create a new Device' do
          expect {
            xhr :post, :create, device: invalid_attributes
          }.to_not change(Device, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'assigns a newly created but unsaved device as @device' do
          xhr :post, :create, device: invalid_attributes
          expect(assigns(:device)).to be_a_new(Device)
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
        expect(response.body).to eql({errors: {role: 'must be an admin to perform this'}}.to_json)
      end
    end

    context 'as admin' do
      include_context 'logged in with admin permissions'

      context 'with valid params' do
        let(:new_attributes) do
          {
            hardware: 'iPhone 5s',
          }
        end

        it 'updates the requested device' do
          device = create :device
          xhr :put, :update, id: device.to_param, device: new_attributes
          device.reload
          expect(device.hardware).to eql('iPhone 5s')
        end

        it 'returns no content' do
          device = create :device
          xhr :put, :update, id: device.to_param, device: new_attributes
          expect(response).to have_http_status(:no_content)
          expect(response.body).to be_blank
        end
      end

      context 'with invalid params' do
        it 'assigns the device as @device' do
          device = create :device
          xhr :put, :update, id: device.to_param, device: invalid_attributes
          expect(assigns(:device)).to eq(device)
        end

        it 'returns a hash of errors' do
          device = create :device
          xhr :put, :update, id: device.to_param, device: invalid_attributes
          expect(response.body).to eql({errors: assigns(:device).errors}.to_json)
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
        expect(response.body).to eql({errors: {role: 'must be an admin to perform this'}}.to_json)
      end
    end

    context 'as admin' do
      include_context 'logged in with admin permissions'

      it 'destroys the requested device' do
        device = create :device
        expect {
          xhr :delete, :destroy, id: device.to_param
        }.to change(Device, :count).by(-1)
      end

      it 'returns no content' do
        device = create :device
        xhr :delete, :destroy, id: device.to_param
        expect(response).to have_http_status(:no_content)
        expect(response.body).to be_blank
      end
    end
  end

  describe 'POST checkout' do
    context 'as user' do
      include_context 'logged in with user permissions'

      it 'responds with forbidden error' do
        xhr :post, :checkout
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eql({errors: {role: 'must be a terminal to perform this'}}.to_json)
      end
    end

    context 'as terminal' do
      include_context 'logged in with terminal permissions'
    end
  end

  describe 'POST return' do
    context 'as user' do
      include_context 'logged in with user permissions'

      it 'responds with forbidden error' do
        xhr :post, :return
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eql({errors: {role: 'must be a terminal to perform this'}}.to_json)
      end
    end

    context 'as terminal' do
      include_context 'logged in with terminal permissions'
    end
  end
end
