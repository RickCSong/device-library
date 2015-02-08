require 'rails_helper'

RSpec.describe 'activities/show', type: :view do
  let(:activity) { create :activity }
  before do
    assign :activity, activity
    render
  end

  subject { JSON.parse(rendered) }

  it 'is valid JSON' do
    expect { subject }.to_not raise_error
  end

  it 'is under the activity namespace' do
    expect(subject).to include('activity')
  end

  context 'properties' do
    subject { JSON.parse(rendered)['activity'] }

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
