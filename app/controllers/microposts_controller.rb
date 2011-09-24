class MicropostsController < ApplicationController
  
  before_filter :authenticate, :only => [:create, :destroy]
  #before_filter :authorized_user, :only => :destroy

  # GET /microposts
  # GET /microposts.xml
  def index
    @microposts = Micropost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @microposts }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.xml
  def show
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @micropost }
    end
  end

  # GET /microposts/new
  # GET /microposts/new.xml
  def new
    @micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])
  end

  # POST /microposts
  # POST /microposts.xml
  def create
      @micropost  = current_user.microposts.build(params[:micropost])
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_path
      else
        @feed_items = []
        render 'pages/home'
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.xml
  def update
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to(@micropost, :notice => 'Micropost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @micropost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.xml
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_back_or root_path
  end

  private

  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end