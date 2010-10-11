# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_forms101_session',
  :secret      => 'a1515b15b180e9d07a320118c78c484849ed5fd3256fbf538ed4a2ce9b48f9956e1b0cd36a44885e8126092cb822c096890e888c128bc1e17412ea9abf5622f5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
