class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!



  def schedule

    #@sections = [Course.find(2).sections.first,Course.find(45).sections.first,Course.find(31).sections.first,Course.find(42).sections.find(194)]
    @sections = []
    @tutorials = []
    #@courses = [Course.find(4), Course.find(45)]
    @courses = [Course.find(1), Course.find(15), Course.find(16),Course.find(3)]
    @mondaySections = []
    @tuesdaySections = []
    @wednesdaySections = []
    @thursdaySections = []
    @fridaySections = []

    if find_all_sections != nil
      find_all_tutorials
      #week_tutorials = separate_sections_according_to_days(@tutorials)
      week_tutorials = [[],[],[],[],[]]
      week_sections = separate_sections_according_to_days(@sections)
      @mondaySections = if week_tutorials[0].flatten != [] then week_sections[0].append(week_tutorials[0].flatten) else week_sections[0] end
      @tuesdaySections = if week_tutorials[1].flatten != [] then week_sections[1].append(week_tutorials[1].flatten)else week_sections[1] end
      @wednesdaySections = if week_tutorials[2].flatten != [] then week_sections[2].append(week_tutorials[2].flatten)else week_sections[2] end
      @thursdaySections = if week_tutorials[3].flatten != [] then week_sections[3].append(week_tutorials[3].flatten)else week_sections[3] end
      @fridaySections = if week_tutorials[4].flatten != [] then week_sections[4].append(week_tutorials[4].flatten)else week_sections[4] end
      # week = sort_all_sections_tutorials_labs([@mondaySections,@thursdaySections,@wednesdaySections,@thursdaySections,@fridaySections])
      # @mondaySections = week[0]
      # @tuesdaySections = week[1]
      # @wednesdaySections = week[2]
      # @thursdaySections = week[3]
      # @fridaySections = week[4]
    end





  end

  def find_all_sections
    @all_courses_sections = []
    @courses.each do |course|
      @all_courses_sections.push(course.sections)
    end
    @possible_sections = @all_courses_sections.inject(&:product).map(&:flatten)
    i = 0
    @sections = @possible_sections[i]

    while (find_conflicts(separate_sections_according_to_days(@sections)) != nil && i < @possible_sections.size - 1 )
      i += 1
      @sections = @possible_sections[i]
    end
    @conflicts_sections = []
    if find_conflicts(separate_sections_according_to_days(@sections)) != []
      @conflicts_sections = find_conflicts(separate_sections_according_to_days(@sections))
      return nil
    else
      return 1
    end

  end


  def find_all_tutorials
    @all_courses_tutorials = []
    @conflicts_tutorials = []
    @sections.each do |section|
      @all_courses_tutorials.push(section.tutorials)
    end
    @possible_tutorials = @all_courses_tutorials.inject(&:product).map(&:flatten)
    i = 0
    @tutorials = @possible_tutorials[i]

    while (find_conflicts(separate_sections_according_to_days(@tutorials)) != nil && i < @possible_tutorials.size - 1 )
      i += 1
      @tutorials = @possible_tutorials[i]
    end

    @conflicts = []
    if find_conflicts(separate_sections_according_to_days(@tutorials)) != []
      @conflicts_tutorials = find_conflicts(separate_sections_according_to_days(@tutorials))
      return nil
    else
      return 1
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

  def separate_sections_according_to_days(classType)
    #contains sections for every day
    week = [[],[],[],[],[]]

    #Sort sections by the day they are given
    classType.each do |section|

      #this boolean is used to ignore multiple 'W' in day_of_each week - issue with seed.rb
      wednesday_added = false

      section.day_of_week.to_s.each_char do |day|

        #duration of a section
        duration = (Time.parse(section.time_end) - Time.parse(section.time_start))

        #duration is given in seconds so divide by 60 to get minutes and then divide by 15min because that time unit in schedule is every
        # 15min. This allow to calculate how many rows a sections will span
        section_row_span = (duration/60/15).ceil
        schedule_section = ScheduleSection.new(section,'#F7F7F7',section_row_span)
        if day == 'M'
          week[0].push(schedule_section)
        end
        if day == 'T'
          week[1].push(schedule_section)
        end
        if day == 'W' && wednesday_added == false
          week[2].push(schedule_section)
          wednesday_added = true
        end
        if day == 'J'
          week[3].push(schedule_section)
        end
        if day == 'F'
          week[4].push(schedule_section)
        end
      end
    end


    sort_all_sections_tutorials_labs(week)

    return week
  end

  #this loop will sort section - section that start the earliest are put in front of the array
  def sort_all_sections_tutorials_labs(week)
    week.each_with_index do |day,i|

      day.each_with_index do |schedule_section1,j|
        day.each_with_index do |schedule_section2,k|
          if (Time.parse(schedule_section1.section.time_start) <=> Time.parse(schedule_section2.section.time_start)) == -1 && j > k
            temp = schedule_section2
            day[k] = schedule_section1
            day[j] = temp
          end
        end
      end
    end
    return week
  end



  #find conflit between sections, if conflict is found
  def find_conflicts (arr)

    # get sections
    conflict_arr = []

    #find conflicts
    arr.each do |day|

      day.each do |schedule_section|
        #get the first section start and end time
        time_start = Time.parse(schedule_section.section.time_start)
        time_end = Time.parse(schedule_section.section.time_end)
        day.each do |another_schedule_section|
          #get the second section start and end time
          other_time_start = Time.parse(another_schedule_section.section.time_start)
          other_time_end = Time.parse(another_schedule_section.section.time_end)

          # Don't compare the same section
          if schedule_section.section != another_schedule_section.section

            if (time_start..time_end).cover? other_time_end
              conflict_arr.push(schedule_section,another_schedule_section)
            elsif (time_start..time_end).cover? other_time_start
              conflict_arr.push(schedule_section,another_schedule_section)
            end

          end
        end
      end
    end

    return conflict_arr.uniq
  end

  class ScheduleSection
    attr_accessor :section,:section_type,:color,:row_span
    def initialize(section,color,row_span)
      self.section = section
      self.color = color
      self.row_span = row_span
      self.section_type = section.class
    end
  end

end