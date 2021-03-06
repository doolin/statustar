# frozen_string_literal: true

require 'spec_helper'

describe UsersController, type: :controller do
  render_views

  let!(:user) { create :user }

  describe '.show' do
    before(:each) do
      test_sign_in(user)
    end

    it 'succeeds' do
      get :show, params: { id: user }
      expect(response).to be_successful
    end

    it 'finds the right user' do
      get :show, params: { id: user }
      expect(response).to be_successful
    end

    it 'has the right title' do
      get :show, params: { id: user }
      expect(response.body).to match(/#{user.name}/)
    end

    # Yes this spec is currently redundant with respect to the
    # spec above. It's not supposed to be.
    it "includes the user's name" do
      get :show, params: { id: user }
      expect(response.body).to match(/#{user.name}/)
    end

    # TODO: move or delete
    it "shows the user's statuses", type: :feature do
      mp1 = create :status, user: user
      mp2 = create :status, user: user
      get :show, params: { id: user }

      expect(response.body).to match(/#{mp1.state}/)
      expect(response.body).to match(/#{mp2.state}/)
    end
  end

  # TODO: move all this into features/new_user
  describe '.new', type: :feature do
    it 'succeeds' do
      get :new
      expect(response).to be_successful
    end

    it 'redirects to root url when signed in' do
      test_sign_in(user)
      get :new
      expect(response).to redirect_to(root_path)
    end

    it 'has a name field' do
      get :new
      expect(response.body).to have_selector("input[name='user[name]'][type='text']")
    end

    it 'has an email field' do
      get :new
      expect(response.body).to have_selector("input[name='user[email]'][type='text']")
    end

    it 'has a password field' do
      get :new
      expect(response.body).to have_selector("input[name='user[password]'][type='password']")
    end

    it 'has a password confirmation field' do
      get :new
      expect(response.body).to have_selector("input[name='user[password_confirmation]'][type='password']")
    end

    it 'has the right title' do
      get :new
      expect(response.body).to have_selector('title', text: 'Statustar | Sign up', visible: false)
    end
  end

  describe '.create' do
    context 'failure' do
      before(:each) do
        @attr = { name: '', email: '', password: '', password_confirmation: '' }
      end

      it 'does not create a user' do
        expect do
          post :create, params: { user: @attr }
        end.not_to change(User, :count)
      end

      it 'has the right title' do
        post :create, params: { user: @attr }
        expect(response.body).to have_selector('title', text: 'Statustar | Sign up', visible: false)
      end

      it 'renders the signup page' do
        post :create, params: { user: @attr }
        expect(response).to be_successful
      end
    end

    context 'success' do
      # TODO: change to let, invoke attributes_for
      before(:each) do
        @attr = {
          name: 'New User',
          email: 'user@example.com',
          password: 'foobar',
          password_confirmation: 'foobar'
        }
      end

      it 'creates a user' do
        expect do
          post :create, params: { user: @attr }
        end.to change(User, :count).by(1)
      end

      it 'signs the user in' do
        post :create, params: { user: @attr }
        expect(controller).to be_signed_in
      end

      it "redirects to the user's page" do
        post :create, params: { user: @attr }
        user = User.find_by(email: 'user@example.com')
        expect(response).to redirect_to(user_path(user))
      end

      it 'displays a welcome message' do
        post :create, params: { user: @attr }
        expect(flash[:success]).to match(/welcome to statustar/i)
      end
    end

    it 'redirects to root url after signing in' do
      test_sign_in(user)
      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe '.edit' do
    before(:each) do
      test_sign_in(user)
    end

    it 'succeeds' do
      get :edit, params: { id: user }
      expect(response).to be_successful
    end

    it 'has the right title' do
      get :edit, params: { id: user }
      expect(response.body).to have_selector('title', text: 'Statustar | Edit user', visible: false)
    end
  end

  describe '.update' do
    before(:each) do
      test_sign_in(user)
    end

    context 'failure' do
      let(:attr) do
        {
          email: '',
          name: '',
          password: '',
          password_confirmation: ''
        }
      end

      it 'renders the edit page' do
        put :update, params: { id: user, user: attr }
        expect(response).to have_http_status(:ok)
      end

      # TODO: move to view spec or delete
      it 'has the right title' do
        put :update, params: { id: user, user: attr }
        expect(response.body).to have_selector('title', text: 'Statustar | Edit user', visible: false)
      end
    end

    context 'success' do
      let(:attr) do
        {
          name: 'New Name',
          email: 'user@example.org',
          password: 'barbaz',
          password_confirmation: 'barbaz'
        }
      end

      it "changes the user's attributes" do
        put :update, params: { id: user, user: attr }
        user.reload
        expect(user.name).to eq attr[:name]
        expect(user.email).to eq attr[:email]
      end

      it 'redirects to the user show page' do
        put :update, params: { id: user, user: attr }
        expect(response).to redirect_to(user_path(user))
      end

      it 'displays a success message' do
        put :update, params: { id: user, user: attr }
        expect(flash[:success]).to match(/updated/)
      end
    end
  end

  describe 'authentication of edit/update pages' do
    context 'for non-signed-in users' do
      it "denies access to 'edit'" do
        get :edit, params: { id: user }
        expect(response).to redirect_to(signin_path)
      end

      it "denies access to 'update'" do
        put :update, params: { id: user, user: {} }
        expect(response).to redirect_to(signin_path)
      end
    end

    context 'for signed-in users' do
      before(:each) do
        wrong_user = create :user, email: 'user@example.net'
        test_sign_in(wrong_user)
      end

      it "requires matching users for 'edit'" do
        get :edit, params: { id: user }
        expect(response).to redirect_to(root_path)
      end

      it "requires matching users for 'update'" do
        put :update, params: { id: user, user: {} }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '.index' do
    context 'for non-signed-in users' do
      it 'denies access' do
        get :index
        expect(response).to redirect_to(signin_path)
        expect(flash[:notice]).to match(/sign in/i)
      end
    end

    describe 'for signed-in users' do
      before(:each) do
        test_sign_in(user)
        second = create :user, email: 'another@example.com'
        third  = create :user, email: 'another@example.net'

        @users = [user, second, third]
        30.times do
          @users << create(:user, email: generate(:email))
        end
      end

      it 'succeeds' do
        get :index
        expect(response).to be_successful
      end

      it 'has the right title' do
        get :index
        expect(response.body).to match(/All users/)
      end

      it 'has an element for each user' do
        get :index
        @users[0..2].each do |_user|
          expect(response.body).to match(/#{@base_title} | Home/)
        end
      end

      it 'paginates users' do
        get :index
        expect(response.body).to have_selector('div.pagination')
        expect(response.body).to have_selector('span.disabled', text: 'Previous')
        expect(response.body).to have_link(nil, href: '/users?page=2', text: '2')
        expect(response.body).to have_link(nil, href: '/users?page=2', text: 'Next')
      end
    end
  end

  describe '.destroy' do
    context 'as a non-signed-in user' do
      it 'denies access' do
        delete :destroy, params: { id: user }
        expect(response).to redirect_to(signin_path)
      end
    end

    context 'as a non-admin user' do
      it 'protects the page' do
        test_sign_in(user)
        delete :destroy, params: { id: user }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'as an admin user' do
      before(:each) do
        admin = create :user, email: 'admin@example.com', admin: true
        test_sign_in(admin)
      end

      it 'destroys the user' do
        expect do
          delete :destroy, params: { id: user }
        end.to change(User, :count).by(-1)
      end

      it 'redirects to the users page' do
        delete :destroy, params: { id: user }
        expect(response).to redirect_to(users_path)
      end

      it 'does not allow admin to self-delete' do
        delete :destroy, params: { id: user }
        expect(response).to redirect_to(users_path)
      end
    end
  end
end
