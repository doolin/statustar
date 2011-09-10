
# Signing in steps.
Given /^user is not logged in$/ do
  visit('/signout') # ensure that at least
end

Given /^user name is "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.new(:name => name,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end

When /^I should be signed in$/ do
  And  %{I should see "/users/1"}
end

# Signing out steps
Given /^user is logged in with "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^user click "([^"]*)" link$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^user is signed out$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^taken to upsells page$/ do
  pending # express the regexp above with the code you wish you had
end
