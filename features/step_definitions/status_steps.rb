
Given /^the user's status is "([^"]*)"$/ do |oldstate|
  #response_body.should have_selector 'input[type=radio][checked=checked][value=information]'
  visit('/statuses/new')
  #input("#busy").should be_checked
  choose(oldstate)
  find_field(oldstate).should be_checked
end

When /^the user clicks "([^"]*)"$/ do |newstate|
  choose(newstate)
end

Then /^the user's status changes to "([^"]*)"$/ do |newstate|
  find_field(newstate).should be_checked

  #pending # express the regexp above with the code you wish you had
end


When /^I (press|follow|check|uncheck|choose) "([^\"]*)" for (.*) whose (.*) is "([^\"]*)"$/ do |action, whatyouclick, class_name, var_name, value|
  unless var_name == "id" then
    id = eval("\"#{class_name}\".classify.constantize.find_by_#{var_name}(\"#{value}\").id.to_s")
  else
    id = value
  end
  within("tr[id=row_#{class_name}_#{id}]") do
    case action
      when "press"
        click_button(whatyouclick)
      when "follow"
        click_link(whatyouclick)
      when "check"
        check(whatyouclick)
      when "uncheck"
        uncheck(whatyouclick)
      when "choose"
        uncheck(whatyouclick)
    end
  end
end