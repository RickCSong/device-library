EmberCLI.configure do |c|
  c.build_timeout = 10
  c.app :user_frontend, path: Rails.root.join('app', 'assets', 'javascripts', 'user-frontend')
  c.app :admin_frontend, path: Rails.root.join('app', 'assets', 'javascripts', 'admin-frontend')
  c.app :terminal_frontend, path: Rails.root.join('app', 'assets', 'javascripts', 'terminal-frontend')
end
