# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :registered,    only: %i[new create]
  before_action :authenticate_user!,  except: %i[show new create]
  # before_action :correct_user,  only: %i[edit update]
  # before_action :admin_user,    only: :destroy

  def index
    @title = 'All users'
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses.paginate(page: params[:page])
    @title = @user.username
  end

  def new
    @user = User.new
    @title = 'Sign up'
  end

  def create
    @user = User.new(permitted_parameters_with_user)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to Statustar!'
      redirect_to @user
    else
      @title = 'Sign up'
      @user.password = nil
      @user.password_confirmation = nil
      render 'new'
    end
  end

  def edit
    @user = current_user # User.find(params[:id])
    @title = 'Edit user'
  end

  def update
    if current_user.update_attributes(permitted_parameters_with_user)
      flash[:success] = 'Profile updated.'
      redirect_to current_user
    else
      @user = current_user
      @title = 'Edit user'
      render 'edit'
    end
  end

  def destroy
    # user = User.find(params[:id])
    # binding.pry
    # unless user_signed_in? # Can't delete yourself Mr. Admin!
      current_user.destroy
      flash[:success] = 'User destroyed.'
    # end
    redirect_to users_path
  end

  def following
    show_follow(:following)
  end

  def followers
    show_follow(:followers)
  end

  def show_follow(action)
    @title = action.to_s.capitalize
    @user = User.find(params[:id])
    @users = @user.send(action).paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def registered
    redirect_to(root_path) if signed_in?
  end

  def permitted_parameters_with_user
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def permitted_parameters
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
