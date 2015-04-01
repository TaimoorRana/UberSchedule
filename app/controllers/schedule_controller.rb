class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!


  def schedule
    @sections = []
    @courses = [Course.find(1), Course.find(15), Course.find(16),Course.find(3)]
    @mondaySections = []
    @tuesdaySections = []
    @wednesdaySections = []
    @thursdaySections = []
    @fridaySections = []

    if find_all_sections != nil
      add_colors
      @mondaySections = @week_sections[0]
      @tuesdaySections = @week_sections[1]
      @wednesdaySections = @week_sections[2]
      @thursdaySections = @week_sections[3]
      @fridaySections = @week_sections[4]
    end
  end

  def add_colors
    colors = ['#ff9900','#9ade00','#19aeff','#ff4141','#ffff3e','#d76cff']
    colors_to_courses = {}
    @courses.each_index do |i|
      colors_to_courses[@courses[i].id] = colors[i]
    end

    @week_sections.each do |day|
      day.each do |schedule_section|
        color = colors_to_courses[schedule_section.section.course.course_id]
        schedule_section.color = color
      end
    end

    return colors_to_courses
    # week.each do |day|
    #   day.each do |section|
    #     if courses_id.include?(section.section.course.course_id) == false
    #       courses_id.append(section.section.course.course_id)
    #     end
    #   end
    # end
  end

  def find_all_sections
    all_courses_sections = []

    @courses.each do |course|
      all_courses_sections.push(course.sections)
    end

    possible_sections = all_courses_sections.inject(&:product).map(&:flatten)
    i = 0

    begin
      @sections = possible_sections[i]
      @week_sections = separate_sections_according_to_days(@sections)
      @conflicts_sections = find_conflicts(@week_sections)
      i += 1
    end while @conflicts_sections != [] && i < (possible_sections.size - 1)

    if @conflicts_sections == []
       find_all_tutorials
      return 1
    else
      return nil
    end

  end


  def find_all_tutorials
    all_courses_tutorials = []

    @sections.each do |section|
      all_courses_tutorials.push(section.tutorials)
    end

    possible_tutorials = all_courses_tutorials.inject(&:product).map(&:flatten)
    i = 0

    begin
      tutorials = possible_tutorials[i]
      week_tutorials = separate_sections_according_to_days(tutorials)
      merged_sections = merge_sections(@week_sections,week_tutorials)
      @conflicts_tutorials = find_conflicts(merged_sections)
      if @conflicts_tutorials = []
        @week_sections = sort_all_sections_tutorials_labs(merged_sections)
        break
      end
      i += 1
    end while @conflicts_tutorials != [] && i < (possible_tutorials.size - 1)

    if @conflicts_tutorials == []
      return 1
    else
      return nil
    end
  end



  def find_all_labs(tutorials)
    all_courses_labs = []

    tutorials.each do |tutorial|
      all_courses_labs.push(tutorial.laboratory)
    end

    possible_labs = all_courses_labs.inject(&:product).map(&:flatten)
    i = 0

    begin
      labs = possible_labs[i]
      week_labs = separate_sections_according_to_days(labs)
      merged_sections = merge_sections(@week_sections,week_labs)
      @conflicts_tutorials = find_conflicts(merged_sections)
      if @conflicts_labs = []
        @week_sections = sort_all_sections_tutorials_labs(merged_sections)
        break
      end
      i += 1
    end while @conflicts_labs != [] && i < (possible_labs.size - 1)

    if @conflicts_labs == []
      return 1
    else
      return nil
    end
  end


  def merge_sections(arr1,arr2)
    arr_merged = [[],[],[],[],[]]
    arr1.each_with_index do |useless,i|
      arr_merged[i] = arr1[i] + arr2[i]
    end
    return arr_merged
  end




  def separate_sections_according_to_days(classType)
    #contains sections for every day
    week = [[],[],[],[],[]]

    #Sort sections by the day they are given
    classType.each do |section|

      #this boolean is used to ignore multiple 'W' in day_of_each week - issue with seed.rb
      wednesday_added = false

      section.day_of_week.to_s.each_char do |day|

        if day != '-'
          #duration of a section
          duration = (Time.parse(section.time_end) - Time.parse(section.time_start))

          #duration is given in seconds so divide by 60 to get minutes and then divide by 5min because that time unit in schedule is every
          # 5min. This allow to calculate how many rows a sections will span
          section_row_span = (duration/60/5).ceil
          schedule_section = ScheduleSection.new(section,'#F7F7F7',section_row_span)
          if day == 'M'
            week[0].push(schedule_section)

          elsif day == 'T'
            week[1].push(schedule_section)

          elsif day == 'W' && wednesday_added == false
            week[2].push(schedule_section)
            wednesday_added = true

          elsif day == 'J'
            week[3].push(schedule_section)

          elsif day == 'F'
            week[4].push(schedule_section)
          else
          end
        end
      end
    end

    return week
  end


  #this loop will sort section - section that start the earliest are put in front of the array
  def sort_all_sections_tutorials_labs(week)
    week.each_with_index do |day,i|

      day.each_with_index do |schedule_section1,j|
        day.each_with_index do |schedule_section2,k|
          if week[i][j] != week[i][k] && (Time.parse(week[i][j].section.time_start) <=> Time.parse(week[i][k].section.time_start)) == -1 && j > k
            temp = week[i][k]
            week[i][k] = week[i][j]
            week[i][j] = temp
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

  class ScheduleSection
    attr_accessor :section,:color,:row_span
    def initialize(section,color,row_span)
      self.section = section
      self.color = color
      self.row_span = row_span
    end
  end

end