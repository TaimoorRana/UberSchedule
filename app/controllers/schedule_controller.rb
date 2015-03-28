class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!



  def schedule

    #@sections = [Course.find(2).sections.first,Course.find(45).sections.first,Course.find(31).sections.first,Course.find(42).sections.find(194)]
    @sections = []
    #@courses = [Course.find(4), Course.find(45)]
    @courses = [Course.find(4), Course.find(45), Course.find(31), Course.find(18),Course.find(17)]
    find_all_schedule
    week = separate_sections_according_to_days
    @conflicts = find_conflicts
    @mondaySections = week[0]
    @tuesdaySections = week[1]
    @wednesdaySections = week[2]
    @thursdaySections = week[3]
    @fridaySections = week[4]





  end

  def find_all_schedule
    @all_courses_sections = []
    @courses.each do |course|
      @all_courses_sections.push(course.sections)
    end
    @possible_schedule = @all_courses_sections.inject(&:product).map(&:flatten)
    i = 0
    @sections = @possible_schedule[i]
    while (find_conflicts != nil && i < @possible_schedule.size - 1 )
      i += 1
      @sections = @possible_schedule[i]
    end

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
    #contains sections for every day
    week = [[],[],[],[],[]]

    #Sort sections by the day they are given
    @sections.each do |section|

      #this boolean is used to ignore multiple 'W' in day_of_each week - issue with seed.rb
      wednesday_added = false

      section.day_of_week.to_s.each_char do |day|

        #duration of a section
        duration = (Time.parse(section.time_end) - Time.parse(section.time_start))

        #duration is given is seconds so divide by 60 to get minutes and then divide by 15min because that time unit in schedule is every
        # 15min. This allow to calculate how many rows a sections will span
        section_row_span = duration/60/15

        if day == 'M'
          week[0].push([section,section_row_span])
        end
        if day == 'T'
          week[1].push([section,section_row_span])
        end
        if day == 'W' && wednesday_added == false
          week[2].push([section,section_row_span])
          wednesday_added = true
        end
        if day == 'J'
          week[3].push([section,section_row_span])
        end
        if day == 'F'
          week[4].push([section,section_row_span])
        end
      end
    end

    #this loop will sort section - section that start the earliest are put in front of the array
    week.each_with_index do |day,i|

      day.each_with_index do |section1,j|
        day.each_with_index do |section2,k|
          if (Time.parse(section1[0].time_start) <=> Time.parse(section2[0].time_start)) == -1 && j > k
            temp = section2
            day[k] = section1
            day[j] = temp
          end
        end
      end
    end

    return week
  end


  #find conflit between sections, if conflict is found
  def find_conflicts

    # get sections
    arr = separate_sections_according_to_days
    conflict_arr = []

    #find conflicts
    arr.each do |day|

      day.each do |section|
        #get the first section start and end time
        time_start = Time.parse(section[0].time_start)
        time_end = Time.parse(section[0].time_end)
        day.each do |another_section|
          #get the second section start and end time
          other_time_start = Time.parse(another_section[0].time_start)
          other_time_end = Time.parse(another_section[0].time_end)

          # Don't compare the same section
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

    return conflict_arr.uniq
  end


end