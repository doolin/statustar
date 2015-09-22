require 'spec_helper'

describe "pages/about" do
  it "infers the controller path" do
    controller.request.path_parameters[:controller].should eq('pages')
  end

  it "infers the controller action" do
    controller.request.path_parameters[:action].should eq('about')
  end

  it "renders head, title and body tags" do
    render :template => "layouts/application"
    expect(rendered).to match(/Help/)
    expect(rendered).to match(/facebook/)
    expect(rendered).to match(/About/)
  end
end
