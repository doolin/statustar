# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ruby_session',
  :secret      => '7b1ad74d521d9a2717e33f139079ddd5149d4985472785846553708b6ec0bc48af64eaa1def860cdacca0bb735ef79ea6ff1031665cd5c7fc58dc3cd63afb7ce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
