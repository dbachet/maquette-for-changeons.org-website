class SessionsController < Devise::SessionsController
  # layout false
  
  def create
      resource = warden.authenticate!(:scope => resource_name, :recall => "sessions/failure")
      
      # SHOULDN'T BE HERE
      @comment = Comment.new
      # SHOULDN'T BE HERE
      
      return sign_in_and_redirect(resource_name, resource)
  end

  def fancy_comment_login
    resource = build_resource
    clean_up_passwords(resource)
    respond_with_navigational(resource, stub_options(resource)){ render :fancy_new, :layout => false }
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(scope, resource) unless warden.user(scope) == resource
    puts "ça marche"
    
    # return render :js => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
    # return render :create 
    respond_to do |format|
      format.js
    end
  end

  def failure
    puts "ça marche pas"
    respond_to do |format|
      format.js
    end
    # return render :js => {:success => false, :errors => ["Login failed."]}
  end

end