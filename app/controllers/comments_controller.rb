class CommentsController < ApplicationController
  # MUST STAY BEFORE :authenticate_user!
  before_filter :sign_in_if_guest, :only => :create
  
  before_filter :authenticate_user!, :only => :create
  after_filter :destroy_guest, :only => :create
  
  
  
  def show_comment_guest_fields
    @comment = Comment.new
    
    # current_or_guest_user
    # guest_user
    #     sign_in(guest_user)
    # Comment.set_write_as_guest
    
    respond_to do |format|
      format.html { redirect_to error_pages_javascript_disabled_path, :alert => "The guest posting is not authorized when javascript is disabled." }
      format.js
    end
  end
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new
    
    # To remove after test
    # guest_user.destroy
    # sign_out(guest_user)
    # session[:guest_user_id] = nil

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
      @comment = current_user.comments.new(params[:comment])
      
      puts current_user.role
      
      if current_user.role == "guest"
        @comment.write_as_guest = true
      else
        @comment.guest_email = nil
        @comment.guest_website = nil
        @comment.write_as_guest = false
      end
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def sign_in_if_guest
    if !current_user
      sign_in(guest_user)
    end
  end
  
  def destroy_guest
    if current_user.role == "guest"
      sign_out(guest_user)
      guest_user.destroy
      session[:guest_user_id] = nil
    end
  end
end
