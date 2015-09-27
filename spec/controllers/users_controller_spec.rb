require 'spec_helper'

describe UsersController do
  render_views

  describe 'GET :show' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end

    it 'should be successful' do
      get :show, id: @user
      response.should be_success
    end

    it 'should find the right user' do
      get :show, id: @user
      assigns(:user).should == @user
    end

    it 'should have the right title' do
      get :show, id: @user
      expect(response.body).to match(/#{@user.name}/)
      # response.should have_selector("title", :text => @user.name)
    end

    # Yes this spec is currently redundant with respect to the
    # spec above. It's not supposed to be.
    it "should include the user's name" do
      get :show, id: @user
      expect(response.body).to match(/#{@user.name}/)
      # response.should have_selector("h1", :text => @user.name)
    end

    it "should show the user's statuses", type: :feature do
      mp1 = FactoryGirl.create(:status, user: @user)
      mp2 = FactoryGirl.create(:status, user: @user)
      get :show, id: @user
      expect(response.body).to match(/#{mp1.state}/)
      expect(response.body).to match(/#{mp2.state}/)
      # response.should have_selector("span.content", :text => mp1.content)
      # response.should have_selector("span.content", :text => mp2.content)
    end
  end

  describe 'GET :new' do
    xit 'should have a name field' do
      get :new
      response.should have_selector("input[name='user[name]'][type='text']")
    end

    xit 'should have an email field' do
      get :new
      response.should have_selector("input[name='user[email]'][type='text']")
    end

    xit 'should have a password field' do
      get :new
      response.should have_selector("input[name='user[password]'][type='password']")
    end

    xit 'should have a password confirmation field' do
      get :new
      response.should have_selector("input[name='user[password_confirmation]'][type='password']")
    end

    xit 'should be successful' do
      get :new
      response.should be_success
    end

    xit 'should have the right title' do
      get :new
      response.should have_selector('title', text: 'Sign up')
    end

    it 'as a signed in user you should be redirect to root url' do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      get :new
      response.should redirect_to(root_path)
    end
  end

  describe 'POST :create' do
    describe 'failure' do
      before(:each) do
        @attr = { name: '', email: '', password: '', password_confirmation: '' }
      end

      it 'should not create a user' do
        lambda do
          post :create, user: @attr
        end.should_not change(User, :count)
      end

      xit 'should have the right title' do
        post :create, user: @attr
        response.should have_selector('title', text: 'Sign up')
      end

      it 'should render the :new page' do
        post :create, user: @attr
        response.should render_template('new')
      end
    end

    describe 'success' do
      before(:each) do
        @attr = { name: 'New User', email: 'user@example.com',
                  password: 'foobar', password_confirmation: 'foobar' }
      end

      it 'should create a user' do
        lambda do
          post :create, user: @attr
        end.should change(User, :count).by(1)
      end

      it 'should sign the user in' do
        post :create, user: @attr
        controller.should be_signed_in
      end

      it 'should redirect to the user :show page' do
        post :create, user: @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it 'should have a welcome message' do
        post :create, user: @attr
        flash[:success].should =~ /welcome to statustar/i
      end
    end

    it 'as a signed in user you should be redirect to root url' do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      post :create # No need to send any attributes, shouldn't get that far ...
      response.should redirect_to(root_path)
    end
  end

  describe 'GET :edit' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end

    it 'should be successful' do
      get :edit, id: @user
      response.should be_success
    end

    xit 'should have the right title' do
      get :edit, id: @user
      response.should have_selector('title', text: 'Edit user')
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end

    describe 'failure' do
      before(:each) do
        @attr = { email: '', name: '', password: '',
                  password_confirmation: '' }
      end

      it "should render the 'edit' page" do
        put :update, id: @user, user: @attr
        response.should render_template('edit')
      end

      it 'should have the right title' do
        put :update, id: @user, user: @attr
        expect(response.body).to match(/Edit user/)
        # response.should have_selector("title", :text => "Edit user")
      end
    end

    describe 'success' do
      before(:each) do
        @attr = { name: 'New Name', email: 'user@example.org',
                  password: 'barbaz', password_confirmation: 'barbaz' }
      end

      it "should change the user's attributes" do
        put :update, id: @user, user: @attr
        @user.reload
        @user.name.should  == @attr[:name]
        @user.email.should == @attr[:email]
      end

      it 'should redirect to the user show page' do
        put :update, id: @user, user: @attr
        response.should redirect_to(user_path(@user))
      end

      it 'should have a flash message' do
        put :update, id: @user, user: @attr
        flash[:success].should =~ /updated/
      end
    end
  end

  describe 'authentication of edit/update pages' do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    describe 'for non-signed-in users' do
      it "should deny access to 'edit'" do
        get :edit, id: @user
        response.should redirect_to(signin_path)
      end

      it "should deny access to 'update'" do
        put :update, id: @user, user: {}
        response.should redirect_to(signin_path)
      end
    end

    describe 'for signed-in users' do
      before(:each) do
        wrong_user = FactoryGirl.create(:user, email: 'user@example.net')
        test_sign_in(wrong_user)
      end

      it "should require matching users for 'edit'" do
        get :edit, id: @user
        response.should redirect_to(root_path)
      end

      it "should require matching users for 'update'" do
        put :update, id: @user, user: {}
        response.should redirect_to(root_path)
      end
    end
  end

  describe "GET 'index'" do
    describe 'for non-signed-in users' do
      it 'should deny access' do
        get :index
        response.should redirect_to(signin_path)
        flash[:notice].should =~ /sign in/i
      end
    end

    describe 'for signed-in users' do
      before(:each) do
        @user = test_sign_in(FactoryGirl.create(:user))
        second = FactoryGirl.create(:user, email: 'another@example.com')
        third  = FactoryGirl.create(:user, email: 'another@example.net')

        @users = [@user, second, third]
        30.times do
          @users << FactoryGirl.create(:user, email: FactoryGirl.generate(:email))
        end
      end

      it 'should be successful' do
        get :index
        response.should be_success
      end

      it 'should have the right title' do
        get :index
        expect(response.body).to match(/All users/)
        # response.should have_selector("title", :text => "All users")
      end

      it 'should have an element for each user' do
        get :index
        @users[0..2].each do |user|
          expect(response.body).to match(/#{@base_title} | Home/)
          # response.should have_selector 'li', :text => user.name
        end
      end

      xit 'should paginate users' do
        get :index
        response.should have_selector('div.pagination')
        response.should have_selector('span.disabled', text: 'Previous')
        response.should have_selector('a', href: '/users?page=2', text: '2')
        response.should have_selector('a', href: '/users?page=2', text: 'Next')
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    describe 'as a non-signed-in user' do
      it 'should deny access' do
        delete :destroy, id: @user
        response.should redirect_to(signin_path)
      end
    end

    describe 'as a non-admin user' do
      it 'should protect the page' do
        test_sign_in(@user)
        delete :destroy, id: @user
        response.should redirect_to(root_path)
      end
    end

    describe 'as an admin user' do
      before(:each) do
        admin = FactoryGirl.create(:user, email: 'admin@example.com', admin: true)
        test_sign_in(admin)
      end

      it 'should destroy the user' do
        lambda do
          delete :destroy, id: @user
        end.should change(User, :count).by(-1)
      end

      it 'should redirect to the users page' do
        delete :destroy, id: @user
        response.should redirect_to(users_path)
      end

      it 'should not allow admin to delete himself' do
        delete :destroy, id: @user
        response.should redirect_to(users_path)
      end
    end
  end
end
