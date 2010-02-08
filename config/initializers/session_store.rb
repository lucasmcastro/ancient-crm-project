# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crm_session',
  :secret      => 'ab9df6c9426fa0a0348ffb1aab31921c5351643ef11892f3093b79a703002489e19111a1df38dd7e63ecf65d157c3854fe6b7b8bfdae2e0aceeb3ca1734c6c17'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
