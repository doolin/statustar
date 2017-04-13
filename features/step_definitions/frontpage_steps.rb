# frozen_string_literal: true

Given /^reader is on home page$/ do
  visit('/')
end

When /^the reader clicks "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^the reader should be on the "([^"]*)" page$/ do |id|
  expect(page).to have_css("div##{id}")
end
