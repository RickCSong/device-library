RSpec.shared_context 'logged in as user' do
  include SSOMacros
  let(:user) { create :user }

  before do
    fake_sso_login(user)
  end
end

RSpec.shared_context 'logged in as admin' do
  include SSOMacros
  let(:user) { create :user, :admin }

  before do
    fake_sso_login(user)
  end
end

RSpec.shared_context 'logged in as terminal' do
  include SSOMacros
  let(:user) { create :user, :terminal }

  before do
    fake_sso_login(user)
  end
end
