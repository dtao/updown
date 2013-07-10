##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  set :session_secret, ENV['SESSION_SECRET']
  set :protection, true
end

# Mounts the core application for this project
Padrino.mount('Updown::App', :app_file => Padrino.root('app/app.rb')).to('/')
