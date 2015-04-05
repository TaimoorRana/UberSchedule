require 'test_helper'


class ScheduleControllerTest < ActionController::TestCase

  test "should get schedule" do
    uberStudent = User.create(username: 'UberTeam',first_name:'Uber',last_name: 'Team', email: 'uberteam@gmail.com', password: 12345678,password_confirmation: 12345678)
    sign_in (uberStudent)
    get :schedule, q:'SOEN 342,SOEN 343,COMP 345,SOEN 287,SOEN 384'
    assert_response :success
  end

  test "seperate sections according to days" do
    schedule_controller = ScheduleController.new
    section1 = Section.find(1)
    section2 = Section.find(13)
    section3 = Section.find(30)
    week = schedule_controller.separate_sections_according_to_days([section1,section2,section3])

    assert week[0][0].section == section1,['section1,Monday']
    assert week[1][0].section == section2,['section2,Tuesday']
    assert week[2][0].section == section1,['section1,Wednesday']
    assert week[2][1].section == section3,['section3,Wednesday']
    assert week[3][0].section == section2,['section2,Thursday']
    assert week[4][0].section == section3,['section3,Friday']
  end

  test "sort_all_sections_tutorials_labs" do
    schedule_controller = ScheduleController.new
    section1 = Section.find(1)
    section2 = Section.find(13)
    section3 = Section.find(30)
    week = schedule_controller.separate_sections_according_to_days([section1,section2,section3])
    week_sorted = schedule_controller.sort_all_sections_tutorials_labs(week)
    week_sorted.each do |day|
      day.each_index do |i|
        if day[i+1].nil? == false
          assert (Time.parse(day[i].section.time_end) <=> Time.parse(day[i+1].section.time_start)) == -1,['pass']
        end
      end
    end
  end

  test "find_conflicts" do
    schedule_controller = ScheduleController.new
    # these sections have conflicts
    section1 = Section.find(5)
    section2 = Section.find(11)
    section3 = Section.find(30)

    week = schedule_controller.separate_sections_according_to_days([section1,section2,section3])
    conflicts = schedule_controller.find_conflicts(week)
    assert conflicts.empty? == false,['pass']

    #these sections do not conflicts
    section1 = Section.find(1)
    section2 = Section.find(13)
    section3 = Section.find(30)

    week = schedule_controller.separate_sections_according_to_days([section1,section2,section3])
    conflicts = schedule_controller.find_conflicts(week)
    assert conflicts.empty? == true,['pass']
  end


  test "merge_weeks" do
    schedule_controller = ScheduleController.new
    test_section = Section.find(1)
    week1 = [[test_section,test_section],[test_section,test_section],[test_section,test_section],[test_section,test_section],[test_section,test_section]]
    week2 = [[test_section,test_section],[test_section,test_section],[test_section,test_section],[test_section,test_section],[test_section,test_section]]

    week_merged = schedule_controller.merge_weeks(week1,week2)
    assert week_merged.size == 5
    week_merged.each do |day|
      assert day.size == 4, ['pass']
    end
  end

end
