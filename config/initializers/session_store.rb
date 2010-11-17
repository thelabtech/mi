# Be sure to restart your server when you modify this file.

# Mi::Application.config.session_store :cookie_store, :key => '_mi_session'
require 'action_dispatch/middleware/session/dalli_store'
Mi::Application.config.session_store :dalli_store, :memcache_server => ['127.0.0.1'], :namespace => 'sessions', :key => '_mi_session'#, :expire_after => 2.months

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# Mi::Application.config.session_store :active_record_store
