EmberCLI.configure do |c|
  c.build_timeout = 10
  c.app :user_frontend, path: Rails.root.join('js-app', 'user-frontend')
  c.app :admin_frontend, path: Rails.root.join('js-app', 'admin-frontend')
  c.app :terminal_frontend, path: Rails.root.join('js-app', 'terminal-frontend')
end
