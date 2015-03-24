require 'spec_helper'

describe "FriendlyForwardings" do
  it "should forward to the requested page after signin" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in :session_email,    :with => user.email
    fill_in :session_password, :with => user.password
    click_button "Sign in"

    page.should render_template('users/edit')
  end
end
