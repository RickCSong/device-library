require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:admin) { create :user, :admin }

  before do
    fake_sso_login(admin)
  end

  describe 'GET index' do
    include_context 'logged in as user'

    let!(:users) { create_list :user, 10 }

    it 'assigns all users as @users' do
      xhr :get, :index, {}
      expect(assigns(:users)).to eq(User.all)
    end

    it 'renders the index template' do
      xhr :get, :index, {}
      is_expected.to render_template('index')
    end
  end

  describe 'GET show' do
    include_context 'logged in as user'

    let!(:user) { create :user }

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
