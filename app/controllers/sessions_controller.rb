# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @title = 'Sign in'
  end

  def create
    user = User.authenticate(email, password)

    if user.nil?
      flash.now[:error] = 'Invalid email/password combination.'
      @title = 'Sign in'
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def permitted_params
    params.require(:session).permit(:email, :password)
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def email
    permitted_params.to_h[:email]
  end

  def password
    permitted_params.to_h[:password]
  end
end
