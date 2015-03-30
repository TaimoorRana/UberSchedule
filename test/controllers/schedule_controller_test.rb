require 'test_helper'


class ScheduleControllerTest < ActionController::TestCase
  test "should get schedule" do
    uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
    sign_in (uberStudent)
    #get :schedule
    assert_response :success
  end

  test "seperate sections according to days" do
    schedule_controller = ScheduleController.new
    section1 = Section.find(1)
    section2 = Section.find(13)
    section3 = Section.find(30)
    week = schedule_controller.separate_sections_according_to_days([section1,section2,section3])

    assert week[0][0][0] == section1,['valid']
    assert week[1][0][0] == section2,['valid']
    assert week[2][0][0] == section1,['valid']
    assert week[2][1][0] == section3,['valid']
    assert week[3][0][0] == section2,['valid']
    assert week[4][0][0] == section3,['valid']
  end

end
