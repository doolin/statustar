require 'spec_helper'

describe MicropostsController do

  def mock_micropost(stubs={})
    (@mock_micropost ||= mock_model(Micropost).as_null_object).tap do |micropost|
      micropost.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all microposts as @microposts" do
      Micropost.stub(:all) { [mock_micropost] }
      get :index
      assigns(:microposts).should eq([mock_micropost])
    end
  end

  describe "GET show" do
    it "assigns the requested micropost as @micropost" do
      Micropost.stub(:find).with("37") { mock_micropost }
      get :show, :id => "37"
      assigns(:micropost).should be(mock_micropost)
    end
  end

  describe "GET new" do
    it "assigns a new micropost as @micropost" do
      Micropost.stub(:new) { mock_micropost }
      get :new
      assigns(:micropost).should be(mock_micropost)
    end
  end

  describe "GET edit" do
    it "assigns the requested micropost as @micropost" do
      Micropost.stub(:find).with("37") { mock_micropost }
      get :edit, :id => "37"
      assigns(:micropost).should be(mock_micropost)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created micropost as @micropost" do
        Micropost.stub(:new).with({'these' => 'params'}) { mock_micropost(:save => true) }
        post :create, :micropost => {'these' => 'params'}
        assigns(:micropost).should be(mock_micropost)
      end

      it "redirects to the created micropost" do
        Micropost.stub(:new) { mock_micropost(:save => true) }
        post :create, :micropost => {}
        response.should redirect_to(micropost_url(mock_micropost))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved micropost as @micropost" do
        Micropost.stub(:new).with({'these' => 'params'}) { mock_micropost(:save => false) }
        post :create, :micropost => {'these' => 'params'}
        assigns(:micropost).should be(mock_micropost)
      end

      it "re-renders the 'new' template" do
        Micropost.stub(:new) { mock_micropost(:save => false) }
        post :create, :micropost => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested micropost" do
        Micropost.should_receive(:find).with("37") { mock_micropost }
        mock_micropost.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :micropost => {'these' => 'params'}
      end

      it "assigns the requested micropost as @micropost" do
        Micropost.stub(:find) { mock_micropost(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:micropost).should be(mock_micropost)
      end

      it "redirects to the micropost" do
        Micropost.stub(:find) { mock_micropost(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(micropost_url(mock_micropost))
      end
    end

    describe "with invalid params" do
      it "assigns the micropost as @micropost" do
        Micropost.stub(:find) { mock_micropost(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:micropost).should be(mock_micropost)
      end

      it "re-renders the 'edit' template" do
        Micropost.stub(:find) { mock_micropost(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested micropost" do
      Micropost.should_receive(:find).with("37") { mock_micropost }
      mock_micropost.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the microposts list" do
      Micropost.stub(:find) { mock_micropost }
      delete :destroy, :id => "1"
      response.should redirect_to(microposts_url)
    end
  end

end
