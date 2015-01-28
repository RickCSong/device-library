require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'assigns all users as @users' do
      users = create_list :user, 10
      xhr :get, :index, {}
      expect(assigns(:users)).to eq(users)
    end
  end

  describe 'GET show' do
    it 'assigns the requested user as @user' do
      user = create :user
      xhr :get, :show, {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end
end
