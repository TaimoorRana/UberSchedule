class LoginController < ApplicationController
  layout 'Login'
  def index
    
  end

  def login

    if params[:username].present? && params[:password].present?
      found_user = User.where(first_name: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
      if authorized_user
        flash[:notice] = 'you are logged in'
        redirect_to :controller => 'schedule', action: 'schedule'
      else
        flash[:notice] = 'Invalid User'
        redirect_to action: 'index'
      end
    end

    #@user = User.where(:first_name => params[:username])
   # @password = @user.password
   # if @user.password == params[:password]
    #  redirect_to :controller => 'Schedule', :action => 'schedule'
    #end
  end
end
