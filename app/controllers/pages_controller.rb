# frozen_string_literal: true

class PagesController < ApplicationController
  # before_action :authenticate_user!, except: [:home]

  def home
    @title = 'Home'
    if signed_in?
      @status = Status.new
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

    respond_to do |format|
      format.html
      format.xml { head :ok }
      format.js
    end
  end

  def contact
    @title = 'Contact'
  end

  def about
    @title = 'About'
  end

  def help
    @title = 'Help'
  end

  def terms
    @title = 'Terms'
  end

  def privacy
    @title = 'Privacy Policy'
  end

  def faq
    @title = 'Frequently Asked Questions'
  end
end
