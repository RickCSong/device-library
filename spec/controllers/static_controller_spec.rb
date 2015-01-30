require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  describe 'GET index' do
    include_context 'logged in with user permissions'

    it 'renders index template' do
      get :index
      expect(response).to have_http_status(:success)
      is_expected.to render_template('index')
    end
  end
end
