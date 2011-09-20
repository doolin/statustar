
Given /^the user's status is "([^"]*)"$/ do |arg1|
  #response_body.should have_selector 'input[type=radio][checked=checked][value=information]'
  visit('/statuses/new')
  #input("#busy").should be_checked
  choose('status_state_1')
  find_field('status_state_1').should be_checked
  
  
  field_checked = find_field('status_state_1')['checked']
  if field_checked.respond_to? :should
    field_checked.should be_true
  else
    assert field_checked
  end
  #pending # express the regexp above with the code you wish you had
end

When /^the user clicks "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the user's status changes to "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
