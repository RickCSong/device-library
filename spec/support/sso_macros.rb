module SSOMacros
  def fake_sso_login(user)
    cookies['fake_sso.username'] = {
      value: user.username,
      domain: :all,
    }

    cookies['fake_sso.firstname'] = {
      value: user.first_name,
      domain: :all,
    }

    cookies['fake_sso.lastname'] = {
      value: user.last_name,
      domain: :all,
    }

    cookies['fake_sso.fullname'] = {
      value: user.full_name,
      domain: :all,
    }

    cookies['fake_sso.email'] = {
      value: user.email,
      domain: :all,
    }
  end
end
