# frozen_string_literal: true

require 'spec_helper'

describe 'users/show' do
  before(:each) do
    @user = create :user
  end

  it 'renders attributes in <p>' do
    user = build :user, id: 1
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:signed_in?).and_return(false)
    allow(view).to receive(:gravatar_for).with(user, size: 125)
    render
    expect(rendered).to match(/#{user.name}/)
  end

  # TODO: there are no actual status updates here, after
  # it's working, add the status updates.
  it 'renders list of status updates' do
    # allow(view).to receive(:signed_in?).and_return(false)
    allow(view).to receive(:signed_in?).and_return(true)
    u1 = FactoryGirl.create(:user, email: 'foobar@example.com')
    allow(view).to receive(:current_user).and_return(u1)
    allow(view).to receive(:current_user?).with(@user).and_return(true)
    u1.statuses.create(state: 1)
    u1.statuses.create!(state: 2)
    u1.save
    render
    # binding.pry
    # expect(rendered).to have_selector('active')
    # expect(rendered).to have_css('active')
    expect(rendered).to have_css('p.statuses')
  end

  # TODO: this should be in its own spec file as the view file
  # is apparently not a partial
  context 'followers and following' do
    context 'user has followers or is following' do
      # Fails with syntax error in users/show_follow partial.
      # TODO: the example description is wrong, needs to be
      # 'following' and 'followers' or something similar.
      it 'renders Show and Back text' do
        # @users = [@user]
        @users = @user.send(:followers).paginate(page: params[:page])
        allow(view).to receive(:title)
        allow(view).to receive(:signed_in?).and_return(true)
        allow(view).to receive(:current_user).and_return(@user)
        allow(view).to receive(:logo)

        render template: 'layouts/application'
        render template: 'users/show_follow'
        expect(rendered).to match(/following/)
        expect(rendered).to match(/followers/)
      end

      # TODO: make this more clear. Since it's unclear I can't even
      # explain why it's unclear, other than it's not semantically
      # congruent.
      context 'user has no followers' do
        it 'renders Show and Back text' do
          @users = []
          # @users = @user.send(:followers).paginate(page: params[:page])
          allow(view).to receive(:title)
          allow(view).to receive(:signed_in?).and_return(true)
          allow(view).to receive(:current_user).and_return(@user)
          allow(view).to receive(:logo)

          render template: 'layouts/application'
          render template: 'users/show_follow'
          expect(rendered).to match(/following/)
          expect(rendered).to match(/followers/)
        end
      end
    end
  end

  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('users')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end

  # Need to get signed in correctly to get the correct view
  xit 'displays show users' do
    render template: 'layouts/application'
    expect(rendered).to match(/Users/)
  end

  xit 'has correct <title> element ' do
    render template: 'layouts/application'
    expect(rendered).to have_selector('title', text: 'Statustar')
  end
end
