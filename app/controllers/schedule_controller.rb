class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!



  def schedule
    # is used for testing and not mess up the Database
    # comp352 = Course.new(dept:"ENGR",number:"352",credit:1.5,name:"Data Structures and Algorithms")
    # comp352.sections << Section.new(name:"AA",time_start:"16:00",time_end:"18:15")
    # comp352.sections << Section.new(name:"AB",time_start:"10:00",time_end:"12:15")
    #
    @sections = [Course.find(45).sections.first,Course.find(2).sections.first]
    week = separate_sections_according_to_days
    #@mondaySections = [Course.find(2).sections.find(5)]

    @mondaySections = week[0]
    @tuesdaySections = week[1]
    @wednesdaySections = week[2]
    @thursdaySections = week[3]
    @fridaySections = week[4]

    @all_courses_sections = []

    @courses = [Course.find(23),Course.find(1)]

    # add_sections(Section.find(1))
    # add_sections(Section.find(14))
    # add_sections(Section.find(42))
    # add_sections(Section.find(30))
    # add_sections(Section.find(41))

    # @mondaySections = week[0]
    # @tuesdaySections = week[1]
    # @wednesdaySections = week[2]
    # @thursdaySections = week[3]
    # @fridaySections = week[4]


  end

  def find_all_schedule
    @courses.each do |course|
      @all_courses_sections.push(course.sections)
    end
    @possible_schedule = @all_courses_sections.inject(&:product).map(&:flatten)

    @sections = @possible_schedule[0]
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
      wednesday_added = false
      section.day_of_week.to_s.each_char do |day|
        duration = (Time.parse(section.time_end) - Time.parse(section.time_start))
        section_row_span = duration/60/15
        if day == 'M'
          arr[0].push([section,section_row_span])
        end
        if day == 'T'
          arr[1].push([section,section_row_span])
        end
        if day == 'W' && wednesday_added == false
          arr[2].push([section,section_row_span])
          wednesday_added = true
        end
        if day == 'J'
          arr[3].push([section,section_row_span])
        end
        if day == 'F'
          arr[4].push([section,section_row_span])
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