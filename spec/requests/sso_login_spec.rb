require 'rails_helper'

RSpec.describe 'SSO Login', type: :request do
  describe 'routing' do
    context 'not logged in' do
      it 'redirects to SSO if user is not logged in' do
        get '/'
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'logged in' do
      include_context 'logged in with user permissions'

      it 'does not redirect the user' do
        get '/'
        expect(response).to render_template('static/index')
      end
    end
  end
end
