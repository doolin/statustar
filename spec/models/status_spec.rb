require 'spec_helper'

describe Status do

  it "should return the correct state" do
    status = Status.new(:state => 1)
    status.find_active(1).should eq("active")
  end
  
  it "should return inactive correctly" do
    status = Status.new(:state =>2)
    status.find_active(1).should eq("inactive")
  end
  
end
