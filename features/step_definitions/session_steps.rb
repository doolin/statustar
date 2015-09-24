
# Signing in steps.
Given /^user is not logged in$/ do
  visit('/signout') # ensure that at least
end

Given /^user name is "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.new(name: name,
           email: email,
           password: password,
           password_confirmation: password).save!
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

# TODO: change this to check for a unique page id or something.
When /^I should be signed in$/ do
  step  %{I should see "updates"}
end

# Signing out steps
Given /^user is logged in with "([^"]*)"$/ do |userpass|
  visit('/signin')
  step %{user name is "foo" with email "user@test.com" and password "please"}
  step %{I sign in as "#{userpass}"}
end

When /^user clicks "([^"]*)" link$/ do |arg1|
  step %{I follow "Sign out"}
end

# Any sign out step should result in a way to
# sign back in, regardless of what else is on
# the target page.
Then /^user is signed out$/ do
  step  %{I should see "Sign in"}
end

# After signing out, direct the user to a landing page.
# Perhaps we want to upsell, yes? Any other kind of
# landing page could work just as well, depending on
# the business case being implemented.

# Various paths might lead to an upsells page.
Then /^taken to upsells page$/ do
  step  %{I should see "Sign up now!"}
end
