require 'rails_helper'

RSpec.describe 'HTML requests', type: :request do
  describe 'routing' do
    include_context 'logged in as user'

    it 'renders static/index regardless of route' do
      get '/nonexistant_route'
      expect(response).to render_template('static/index')
    end
  end
end
