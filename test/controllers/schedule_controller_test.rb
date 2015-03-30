require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase
  test "should get schedule" do
    uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
    sign_in (uberStudent)
    
    get :schedule
    assert_response :success
  end

end
