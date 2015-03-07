class LoginController < ApplicationController
  layout 'Login'
  def index
    
  end

  def login
    # Verify if the the username and password was entered
    if params[:username].present? && params[:password].present?
      # find the user
      found_user = User.where(username: params[:username]).first
      # if user is found, check if password matches
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
      #if users is authenticated, send them to their schedule
      if authorized_user
        flash[:notice] = 'you are logged in'
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        redirect_to :controller => 'schedule', action: 'schedule'
      #else send them back to the login page
      else
        flash[:notice] = 'Invalid User'
        redirect_to action: 'index'
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to action: index
  end

  def registration

  end

  def registration_user
    # grab all the values for the new user
    new_user = params[:username]
    user_password = params[:password]
    confirmed_password = params[:confirm_password]

    if  user_password.to_s == confirmed_password.to_s && User.where(username: params[:username]).present? == false
      user_created = User.new(username: new_user)
      user_created.password = user_password.to_s
      user_created.save
      redirect_to action: 'index'
    else
      redirect_to action: 'registration'
    end

  end



end
