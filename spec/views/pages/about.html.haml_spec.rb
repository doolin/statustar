# frozen_string_literal: true
require 'spec_helper'

describe 'pages/about' do
  before do
    allow(view).to receive(:title).and_return('Blah')
    allow(view).to receive(:signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(create(:user))
    allow(view).to receive(:logo).and_return('logo')
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('pages')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('about')
  end

  it 'renders head, title and body tags' do
    render template: 'layouts/application'
    expect(rendered).to match(/Help/)
    expect(rendered).to match(/facebook/)
    expect(rendered).to match(/About/)
  end
end
