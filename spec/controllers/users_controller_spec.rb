require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    let!(:users) { create_list :user, 10 }

    before do
      xhr :get, :index, format: :json
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'responds with content-type: application/json' do
      expect(response.content_type).to eql('application/json')
    end

    it 'responds with all users serialized by UserSerializer' do
      expected = users.map { |u| UserSerializer.new(u).serializable_hash }.to_json
      expect(response.body).to include(expected)
    end
  end

  describe 'GET show' do
    let!(:user) { create_list :user, 10 }

    before do
      xhr :get, :index, format: :json
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'responds with content-type: application/json' do
      expect(response.content_type).to eql('application/json')
    end

    it 'responds with the user serialized by UserSerializer' do
      expected = user.map { |u| UserSerializer.new(u).serializable_hash }.to_json
      expect(response.body).to include(expected)
    end
  end
end
