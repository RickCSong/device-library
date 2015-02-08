require 'rails_helper'

RSpec.describe 'activities/index', type: :view do
  let(:activities) { create_list :activity, 10 }
  before do
    assign :activities, activities
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the activities namespace' do
    expect(subject).to include('activities')
  end

  it 'is an array of all activities' do
    expect(subject['activities']).to be_an(Array)
    expect(subject['activities'].length).to eql(10)
  end

  context 'properties' do
    let(:activity) { activities[0] }
    subject { JSON.parse(rendered)['activities'][0] }

    it { is_expected.to include('id') }
    it { expect(subject['id']).to eql(activity.id) }

    it { is_expected.to include('status_from') }
    it { expect(subject['status_from']).to eql(activity.status_from) }

    it { is_expected.to include('status_to') }
    it { expect(subject['status_to']).to eql(activity.status_to) }

    it { is_expected.to include('created_at') }
    it { expect(subject['created_at']).to eql(activity.created_at.as_json) }

    it { is_expected.to include('device') }
    it { expect(subject['device']).to eql(activity.device_id) }

    it { is_expected.to include('user') }
    it { expect(subject['user']).to eql(activity.user_id) }
  end
end
