require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  describe 'GET index' do
    include_context 'logged in with user permissions'

    context 'params[:ids] is not defined' do
      it 'assigns all activities as @activities' do
        create_list :activity, 10
        xhr :get, :index, {}
        expect(assigns(:activities)).to eq(Activity.all)
      end

      it 'renders the index template' do
        xhr :get, :index, {}
        is_expected.to render_template('index')
      end
    end

    context 'params[:ids] is defined' do
      it 'assigns all activities as @activities' do
        create_list :activity, 10
        activities = Activity.first(5)
        xhr :get, :index, ids: activities.map(&:id)
        expect(assigns(:activities)).to eq(activities)
      end

      it 'renders the index template' do
        xhr :get, :index, {}
        is_expected.to render_template('index')
      end
    end
  end

  describe 'GET show' do
    include_context 'logged in with user permissions'

    let!(:activity) { create :activity }

    it 'assigns the requested activity as @activity' do
      xhr :get, :show, id: activity.to_param
      expect(assigns(:activity)).to eq(activity)
    end

    it 'renders the show template' do
      xhr :get, :show, id: activity.to_param
      is_expected.to render_template('show')
    end
  end
end
