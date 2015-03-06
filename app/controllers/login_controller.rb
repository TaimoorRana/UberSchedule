class LoginController < ApplicationController
  layout 'Login'
  def index
    
  end

  def login
  @user = User.where(:first_name => params[:username])
  @password = @user.password
    if @user.password == params[:password]
      redirect_to :controller => 'Schedule', :action => 'schedule'
    end
  end
end
