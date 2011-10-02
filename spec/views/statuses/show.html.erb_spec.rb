require 'spec_helper'

describe "statuses/show.html.erb" do

  before(:each) do
    @status = assign(:status, stub_model(Status,
      :state => 1,
      :user_id => 1
    ))
  end

  xit "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Content/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end

end
