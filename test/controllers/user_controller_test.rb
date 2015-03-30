require 'test_helper'
include Devise::TestHelpers

class UserControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  # before :each do
  #   request.env['devise.mapping'] = Devise.mappings[:user]
  # end
  #
  # test 'destroyed account is signed out' do
  #   sign_in_as_user
  #   get '/users'
  #
  #   User.destroy_all
  #   get '/users'
  #   assert_redirected_to new_user_session_path
  # end
  #
  # test 'not signed in users should see unautheticated page (unauthenticated accepted)' do
  #   get join_path
  #
  #   assert_response :success
  #   assert_template 'home/join'
  #   assert_contain 'Join'
  # end
  #
  # test 'allows session to be set for a given scope' do
  #   sign_in_as_user
  #   get '/users'
  #   assert_equal "Cart", @controller.user_session[:cart]
  # end
  #
  #
  # test 'session id is changed on sign in' do
  #   get '/users'
  #   session_id = request.session["session_id"]
  #
  #   get '/users'
  #   assert_equal session_id, request.session["session_id"]
  #
  #   sign_in_as_user
  #   assert_not_equal session_id, request.session["session_id"]
  # end
  #
  # test 'required_fields should contain the fields that Devise uses' do
  #   assert_same_content Devise::Models::Registerable.required_fields(User), []
  # end

end



