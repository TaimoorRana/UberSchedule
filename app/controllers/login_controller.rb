class LoginController < ApplicationController
  layout 'Login'
  def index
    
  end


  def login
    # Verify if the the username and password was entered
    if params[:username].present? && params[:password].present?
      # find the user in the database
      found_user = User.where(username: params[:username]).first
      # if user is found, check if password matches
      if found_user
        $authorized_user = found_user.authenticate(params[:password])
      end
      #if users is authenticated, send them to their schedule
      if $authorized_user
        #create a session for this user
        session[:user_id] = $authorized_user.id
        session[:username] = $authorized_user.username
        flash[:notice] = "you are logged in"
        redirect_to :controller => 'schedule', action: 'schedule'
      #else send them back to the login page
      else
        flash[:notice] = 'Invalid User'
        redirect_to action: 'index'
      end
    #else username or password field was empty
    else
      flash[:notice] = "Username and/or password field empty"
      redirect_to action: 'index'
    end
  end




  def logout
    #Erase user's stamp
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "you are logged Out"
    redirect_to action: index
  end



  def registration

  end



  def registration_user
    # grab all the values for the new user
    new_user = params[:username]
    user_password = params[:password]
    confirmed_password = params[:confirm_password]

    # if username doesn't exit and the passwords matches, add the user to the database
    if  user_password.to_s == confirmed_password.to_s && !new_user.blank?
      if User.where(username: params[:username]).present? == false
      user_created = User.new(username: new_user)
      user_created.password = user_password.to_s
      user_created.save
      flash[:notice] = "You are now registerd to UberSchedule"
      redirect_to action: 'index'
        # username is already taken
      else
        flash[:notice] = "Username already Exists, Please enter another username"
        redirect_to action: 'registration'
      end
    # password did not match
    else
      flash[:notice] = "Password does not match"
      redirect_to action: 'registration'
    end

  end



end
