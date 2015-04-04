class ScheduleController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!
  attr_accessor :a_possible_schedule


  def index

  end

  def search

  end

  def schedule
    #@courses = [Course.find(1), Course.find(3), Course.find(15),Course.find(16)]
    @courses = [Course.find(42), Course.find(21), Course.find(46),Course.find(47),Course.find(51)]
    @mondaySections = []
    @tuesdaySections = []
    @wednesdaySections = []
    @thursdaySections = []
    @fridaySections = []
    @possible_schedules = []
    schedule_limit = 10
    @week_sections =[]
    all_lectures = find_all_lectures(@courses)
    if all_lectures != []
      #for every lectures combination found
      all_lectures.each do |lectures|
        #separate them into days
        lectures_separated_according_to_days = separate_sections_according_to_days(lectures)
        #if there is no conflicts between sections
        if (@conflicts_sections = find_conflicts(lectures_separated_according_to_days)) == []
          #find all tutorials for these lectures, if they exists
          all_tutorials = find_all_tutorials(lectures)
          #if tutorials do exists
          if all_tutorials != []
            #for every tutorials combination
            all_tutorials.each do |tutorials|
              #separate them into days
              tutorials_separated_according_to_days = separate_sections_according_to_days(tutorials)
              #if there is no conflicts between tutorials
              if (@conflicts_tutorials = find_conflicts(tutorials_separated_according_to_days)) == []
                #find all labs for these tutorials, if they exists
                all_labs = find_all_labs(tutorials)
                #if labs do exists
                if all_labs != []
                  labs_exits = true
                  #for every labs combination
                  all_labs.each do |labs|
                    #separate them into days
                    labs_separated_according_to_days = separate_sections_according_to_days(labs)
                    #if there is no conflicts between labs
                    if (@conflicts_labs = find_conflicts(labs_separated_according_to_days)) == []
                      lectures_tutorials_merged = merge_weeks(lectures_separated_according_to_days,tutorials_separated_according_to_days)
                      all_sections_merged = merge_weeks(lectures_tutorials_merged,labs_separated_according_to_days)

                      if find_conflicts(all_sections_merged) == []
                        if @possible_schedules.size > schedule_limit
                          break
                        end
                        add_colors
                        @week_sections = sort_all_sections_tutorials_labs(all_sections_merged)
                        @possible_schedules.append(PossibleSchedule.new(@week_sections))
                      end

                    end

                  end
                #if no lab exists
                else
                   merge_sections_tutorials = merge_weeks(lectures_separated_according_to_days,tutorials_separated_according_to_days)
                   if find_conflicts(merge_sections_tutorials) == []
                     if @possible_schedules.size > schedule_limit
                       break
                     end
                     add_colors
                     @week_sections = sort_all_sections_tutorials_labs(merge_sections_tutorials)
                     @possible_schedules.append(PossibleSchedule.new(@week_sections))
                   end
                end

              end

            end
            #if no tutorial exists
          else
            if @possible_schedules.size > schedule_limit
              break
            end
              add_colors
              @week_sections = sort_all_sections_tutorials_labs(lectures_separated_according_to_days)
              @possible_schedules.append(PossibleSchedule.new(@week_sections))

          end

        end

      end

    end
    add_colors
    # @mondaySections = @week_sections[0]
    # @tuesdaySections = @week_sections[1]
    # @wednesdaySections = @week_sections[2]
    # @thursdaySections = @week_sections[3]
    # @fridaySections = @week_sections[4]

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
  end




  def find_all_lectures(courses)
    #sections starts as empty
    all_courses_sections = []
    #for every course, attempt to find a or many lectures
    courses.each do |course|
      #for every course, attempt to find a or many sections
      if course.sections != []
      all_courses_sections.push(course.sections.where(term:'Fall'))
      end
    end

    #if there are 2 or more courses that have sections, find and return all combinations
    if  all_courses_sections.size >= 2
      return  all_courses_sections.inject(&:product).map(&:flatten)
      # else return 2 ,1 or no sections
    else all_courses_sections.size == 1
    return  all_courses_sections
    end
  end




  def find_all_tutorials(sections)
    #tutorials starts as empty
    all_courses_tutorials = []

    #for every section, attempt to find a or many tutorials
    sections.each do |section|
      #if sections have tutorials, add to all_courses_tutorial
      if section.tutorials != []
        all_courses_tutorials.push(section.tutorials)
      end
    end

    #if there are 2 or more sections that have tutorials, find and return all combinations
    if  all_courses_tutorials.size >= 2
      return  all_courses_tutorials.inject(&:product).map(&:flatten)
      # else return 2 ,1 or no tutorials
    else
      return  all_courses_tutorials
    end

  end



  def find_all_labs(tutorials)
    #labs starts as empty
    all_courses_labs = []

    #for every tutorial, attempt to find a lab
    tutorials.each do |tutorial|
      #if tutorial have a lab, add to all_courses_labs
      if tutorial.laboratories != []
        all_courses_labs.push(tutorial.laboratories)
      end
    end

    #if there are 2 or more tutorials that have labs, find and return all combinations
    if all_courses_labs.size >= 2
      return all_courses_labs.inject(&:product).map(&:flatten)
    # else return 2 ,1 or no lab
    else
      return all_courses_labs
    end

  end




  def merge_weeks(week1,week2)
    arr_merged = [[],[],[],[],[]]
    week1.each_index do |i|
      arr_merged[i] = week1[i] + week2[i]
    end
    return arr_merged
  end



  def separate_sections_according_to_days(classType)
    #contains sections for every day
    week = [[],[],[],[],[]]
    if classType.is_a?(Array) == false
      classType = [classType]
    end
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
          section_row_span = (duration/60/15).ceil
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
  def find_conflicts (week)

    # get sections
    conflict_arr = []

    #find conflicts
    week.each do |day|

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

  class PossibleSchedule
    attr_accessor :possible_schedule,:time_start,:time_end,:total_rows
    def initialize(possible_schedule)
      self.possible_schedule = possible_schedule
      self.time_start = get_start_time
      self.time_end = get_end_time
      self.total_rows = cal_total_rows(Time.parse(time_start),Time.parse(time_end))
    end

    def get_start_time
      time_start = Time.parse('23:59')
      possible_schedule.each do |day|
        if day != [] && (Time.parse(day.first.section.time_start) <=> time_start) == -1
          time_start = day.first.section.time_start
        end
      end
      return time_start
    end


    def get_end_time
      time_end = Time.parse('00:01')
      possible_schedule.each do |day|
        if day != [] && (Time.parse(day.last.section.time_end) <=> time_end) == 1
          time_end = day.last.section.time_end
        end
      end
      return time_end
    end

    def cal_total_rows(time_start, time_end)
      total_rows = 0
      seconds_diff = (time_start - time_end).to_i.abs

      hours = seconds_diff / 3600
      seconds_diff -= hours * 3600

      minutes = seconds_diff / 60
      seconds_diff -= minutes * 60

      seconds = seconds_diff

      total_rows += hours * 4
      total_rows += minutes%15

      return total_rows
    end
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