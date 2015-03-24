class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!



  def schedule
    # is used for testing and not mess up the Database
    # comp352 = Course.new(dept:"ENGR",number:"352",credit:1.5,name:"Data Structures and Algorithms")
    # comp352.sections << Section.new(name:"AA",time_start:"16:00",time_end:"18:15")
    # comp352.sections << Section.new(name:"AB",time_start:"10:00",time_end:"12:15")
    #
    #   @mondaySections = [Course.find(2).sections.find(5),Course.find(1).sections.find(1)]
    #   @tuesdaySections = [Course.find(3).sections.find(13),Course.find(3).sections.find(16)]
    #   @wednesdaySections = [Course.find(4).sections.find(24),Course.find(7).sections.find(42)]
    #   @thursdaySections = [Course.find(9).sections.find(58),Course.find(9).sections.find(66)]
    #   @fridaySections = [Course.find(8).sections.find(53),Course.find(9).sections.find(62)]

    @sections = []
    add_sections(Section.find(1))
    add_sections(Section.find(14))
    add_sections(Section.find(42))
    add_sections(Section.find(30))
    add_sections(Section.find(41))
    @conflicts = find_conflicts
    week = separate_sections_according_to_days
    @mondaySections = week[0]
    @tuesdaySections = week[1]
    @wednesdaySections = week[2]
    @thursdaySections = week[3]
    @fridaySections = week[4]



  end

  def registered_courses

    @courses = current_user.student.courses
    @totalCredits = 0

    @courses.each do |course|
      @totalCredits += course.credit
    end

  end

  def add_sections(section)
    @sections.push(section)
  end

  def separate_sections_according_to_days
    arr = [[],[],[],[],[]]
    @sections.each do |section|
      section.day_of_week.to_s.each_char do |day|
        if day == 'M'
          arr[0].push(section)
        end
        if day == 'T'
          arr[1].push(section)
        end
        if day == 'W'
          arr[2].push(section)
        end
        if day == 'J'
          arr[3].push(section)
        end
        if day == 'F'
          arr[4].push(section)
        end
      end
    end

    return arr
  end

  def find_conflicts
    arr = separate_sections_according_to_days
    conflict_arr = []
    arr.each do |day|
      day.each do |section|
        time_start = Time.parse(section.time_start)
        time_end = Time.parse(section.time_end)
        day.each do |another_section|
          other_time_start = Time.parse(another_section.time_start)
          other_time_end = Time.parse(another_section.time_end)
          if section != another_section
            if (time_start..time_end).cover? other_time_end
              conflict_arr.push(section,another_section)
            elsif (time_start..time_end).cover? other_time_start
              conflict_arr.push(section,another_section)
            end
          end
        end
      end
    end
    return conflict_arr.to_set
  end


end
