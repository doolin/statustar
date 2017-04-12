# frozen_string_literal: true
class SessionsController < ApplicationController
  def new
    @title = 'Sign in'
  end

  def create
    params.permit(:email, :password)
    user = User.authenticate(params[:email], params[:password])

    if user.nil?
      flash.now[:error] = 'Invalid email/password combination.'
      @title = 'Sign in'
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
