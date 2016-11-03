# app/config/initializers/warden_hooks.rb
Warden::Manager.after_set_user do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies["auth.#{scope}.id"] = user.id.to_s
end