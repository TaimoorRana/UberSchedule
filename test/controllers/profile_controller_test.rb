require 'test_helper'

class ProfileControllerTest < ActionController::TestCase

  test "Profile page is loaded" do
    uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
    sign_in (uberStudent)
    get :profile
    assert_response :success
  end

  test "Student preferences are added" do
    uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
    sign_in (uberStudent)
    get :updateProfile, noMondayAm: 1, noFridayAm: 1
    assert uberStudent.student.preferences[0].preference == 'noMondayAm',['monday pass']
    assert uberStudent.student.preferences[1].preference =='noFridayAm',['friday pass']
  end

  # test "Student preferences are removed" do
  #   uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
  #   sign_in (uberStudent)
  #   get :updateProfile, noMondayAm: 1, noFridayAm: 1
  #   assert uberStudent.student.preferences[0].preference == 'noMondayAm',['monday pass']
  #   assert uberStudent.student.preferences[1].preference =='noFridayAm',['friday pass']
  #   get :profile
  #   get :updateProfile, :noMondayAm => 0, :noFridayAm => 0
  #   assert uberStudent.student.preferences.size == 0, ['preferences deleted']
  # end

  test "Student option is saved" do
    uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
    sign_in (uberStudent)
    get :updateProfile, option: 'Computer Games'
    assert uberStudent.student.option == 'Computer Games', ['option saved']
  end

  # test "Student option can be changed" do
  #   uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
  #   sign_in (uberStudent)
  #   get :updateProfile, option: 'Computer Games'
  #   assert uberStudent.student.option == 'Computer Games', ['option saved']
  #   get :profile
  #   get :updateProfile, option: 'General'
  #   assert uberStudent.student.option == 'General', ['option saved']
  # end

end
