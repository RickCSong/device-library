EmberCLI.configure do |c|
  c.build_timeout = 10
  c.app :user_frontend, path: Rails.root.join('jsapp', 'user-frontend')
  c.app :admin_frontend, path: Rails.root.join('jsapp', 'admin-frontend')
  c.app :terminal_frontend, path: Rails.root.join('jsapp', 'terminal-frontend')
end
