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
  end

  def registration

  end

  def registration_user
    new_user = params[:username]
    user_password = params[:password]
    confirmed_password = params[:confirm_password]

    if  user_password.to_s == confirmed_password.to_s
      user_created = User.new(:first_name => new_user)
      user_created.password = user_password.to_s
      user_created.save
      redirect_to action: 'index'
    else
      redirect_to action: 'registration'
    end

  end
end
