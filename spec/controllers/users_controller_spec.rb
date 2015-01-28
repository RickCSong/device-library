require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'assigns all users as @users' do
      users = create_list :user, 10
      xhr :get, :index, {}
      expect(assigns(:users)).to eq(users)
    end

    it 'renders the index template' do
      xhr :get, :index, {}
      is_expected.to render_template('index')
    end
  end

  describe 'GET show' do
    let(:user) { create :user }

    it 'assigns the requested user as @user' do
      xhr :get, :show, id: user.to_param
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      xhr :get, :show, id: user.to_param
      is_expected.to render_template('show')
    end
  end
end
