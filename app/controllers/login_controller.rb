class LoginController < ApplicationController

  layout 'Login'

  def index
    
  end

  def registration

  end

  def login
    # Verify if the the username and password was entered
    if params[:username].present? && params[:password].present?
      # find the student in the database
      found_user = User.where(username: params[:username]).first
      # if student is found, check if password matches
      if found_user
        #$authorized_user = found_user.authenticate(params[:password])
        $authorized_user = found_user
      end
      #if users is authenticated, send them to their schedule
      if $authorized_user
        #create a session for this student
        session[:user_id] = $authorized_user.user_id
        session[:username] = $authorized_user.username
        $authorized_student = Student.where(user_id: $authorized_user.user_id).first

        studentFirstname = $authorized_student.firstname

        flash[:notice] = "you are logged in #{studentFirstname}"

       # put $authorized_user.user_id
       # $authorized_student = Student.where(user_id: $authorized_user.user_id )
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
    #Erase student's stamp
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "you are logged Out"
    redirect_to action: index
  end


  def registration_user
    # grab all the values for the new student
    new_user = params[:username]
    user_password = params[:password]
    confirmed_password = params[:confirm_password]

    # if username doesn't exit and the passwords matches, add the student to the database
    if  user_password.to_s == confirmed_password.to_s && !new_user.blank?
      if User.where(user_name: params[:username]).present? == false
      user_created = User.new(user_name: new_user)
      user_created.user_pass = user_password.to_s
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
