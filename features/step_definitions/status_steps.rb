
Given /^the user's status is "([^"]*)"$/ do |oldstate|
  # response_body.should have_selector 'input[type=radio][checked=checked][value=information]'
  @user = User.create!(name: 'dave', email: 'dave@test.com', password: 'foobar', password_confirmation: 'foobar')
  # puts @user.instance_variables
  visit('/statuses/new')
  # input("#busy").should be_checked
  choose(oldstate)
  find_field(oldstate).should be_checked
end

When /^the user clicks "([^"]*)"$/ do |newstate|
  choose(newstate)
end

When /^presses "([^"]*)"$/ do |arg1|
  click_button 'Create Status'
end

Then /^the user's status changes to "([^"]*)"$/ do |newstate|
  # puts "Status path" + status_path(1) #, status_path
  # get :show, :id => @status
  # puts @user.instance_variables
  # puts @user.inspect
  # puts @user.to_s
  # puts @user.to_yaml
  puts YAML::dump(@user.statuses)
  visit status_path(@user)
  # find_field(newstate).should be_checked
  newstate = newstate.downcase
  ###  TODO: explain why this passes.
  page.should have_selector('span', class: 'foobabractive', id: newstate)
  page.should have_css("span.active##{newstate}")
  # page.should have_no_selector("span", :class => 'inactive', :id => newstate)
  page.should have_no_css("span.inactive##{newstate}")
  # page.should have_xpath('//span[@class="inactive"]', :count => 2)
  # page.should have_xpath('//span[@class="active"]', :count => 2)
  # response.should have_xpath('//span[@class="active"]', :count => 2)
end


Given /^the user is on the home page$/ do
  visit root_path
end

When /^the user updates status$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the updated status should be displayed$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the user must not be able to delete existing statuses$/ do
  pending # express the regexp above with the code you wish you had
end


When /^I (press|follow|check|uncheck|choose) "([^\"]*)" for (.*) whose (.*) is "([^\"]*)"$/ do |action, whatyouclick, class_name, var_name, value|
  id = unless var_name == 'id' then
         eval("\"#{class_name}\".classify.constantize.find_by_#{var_name}(\"#{value}\").id.to_s")
       else
         value
       end
  within("tr[id=row_#{class_name}_#{id}]") do
    case action
    when 'press'
      click_button(whatyouclick)
    when 'follow'
      click_link(whatyouclick)
    when 'check'
      check(whatyouclick)
    when 'uncheck'
      uncheck(whatyouclick)
    when 'choose'
      uncheck(whatyouclick)
    end
  end
end
