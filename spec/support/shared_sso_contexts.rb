RSpec.shared_context 'logged in with user permissions' do
  include SSOMacros
  let(:current_user) { create :user }

  before do
    fake_sso_login(current_user)
  end
end

RSpec.shared_context 'logged in with admin permissions' do
  include SSOMacros
  let(:current_user) { create :user, :admin }

  before do
    fake_sso_login(current_user)
  end
end

RSpec.shared_context 'logged in with terminal permissions' do
  include SSOMacros
  let(:current_user) { create :user, :terminal }

  before do
    fake_sso_login(current_user)
  end
end
