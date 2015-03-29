class SequenceGeneratorController < ApplicationController
  layout 'general_schedule'
  before_action :authenticate_user!, :optionSelected, :generateSequence, only: [:Sequence, :updateDoneCourses]

  def Sequence
    modifiedsequence = createDeepCopyOfSequence(@sequence)
    @student.courses.each do |course| #Removes already completed courses from viewable sequence
      modifiedsequence.each do |sequence|
        if sequence[1].courses.include?(course)
          sequence[1].courses.delete(course)
        end
      end
    end
    @sequence = modifiedsequence
  end

  def updateDoneCourses #Removes courses from the list of courses that were initially shown, which are part of general curriculum for specialization.

    error = []
    updatedSequence = createDeepCopyOfSequence(@sequence)
    params.each do |course_id|
      if course_id[1] == "1" #Check if its a course param
        updatedSequence.each do |sequence|
          sequence[1].courses.each do |course|
            if course.id == course_id[0].to_i #Check if course is contained within sequence block
              if prereqsAreMet(course.id) #check if prereqs met
                updatedSequence[sequence[0]].courses.delete(course)
                @student.courses.append(course)
              else
                params.keys # prereq not met. Check if prereq is selected
                prereq_ids = []
                course.courses_prereqs.each do |prereq|
                  prereq_ids.append(prereq.course_id_prereq)
                end
                if (prereq_ids - params.keys).empty?
                  updatedSequence[sequence[0]].courses.delete(course)
                  @student.courses.append(course)
                else # prereq not selected. ERROR
                  error.append(" #{course.dept} #{course.number}")
                end
              end

            end
          end

        end
      end

    end
    @sequence = updatedSequence
    flash[:notice] = "Courses Updated Successfully."
    unless error.size == 0 # Print out an error message depending on whether or not prereqs are met
      errorMessage = "The following course(s)'s prerequisites have not been met: "
      error.each do |course|
        errorMessage += course
      end
      flash[:notice] = errorMessage
      redirect_to(:action => 'Sequence')
    end
  end

  def personalizedSequence # Will take as input a list of course IDs and create an array of these. Is used to give personalized sequence filled with classes that are desired to be taken.
    @listOfCourses = []
    params.each do |course_id|
      if course_id[1] == "1"
        course = Course.find(course_id[0].to_i)
        @listOfCourses.append(course)

      end
    end
    @listOfCourses.sort

  end

  private
  def generateSequence ## Private Method to generate a hashmap of Core, Required and Obligatory_list_of_courses_to_be_picked_from_list. For use with displaying the  initial sequence.
    user_id = current_user.user_id
    @option = Student.where(user_id: user_id).first.option
    unless params[:option].nil? #if a sequence id is given after path e.g. /sequence/6, then will show sequence of Web Services. Useful for debugging
      s = Sequence.find(params[:option].to_i)
      @option = s.sequence_name
    end

    @sequence = {} # Store each sequence group in a hashmap.
    @sequence[:core] = Sequence.where(sequence_name: 'Software Engineering Core').first
    if @option == 'Web Services and Applications'
      @sequence[:required] = Sequence.where(sequence_name: 'Required Web Services and Applications').first
      @sequence[:one_of] = Sequence.where(sequence_name: 'OneOf Web Services and Applications').first
    elsif @option == 'Computer Games'
      @sequence[:required] = Sequence.where(sequence_name: 'Required Computer Games').first
      @sequence[:one_of] = Sequence.where(sequence_name: 'OneOf Computer Games').first
    elsif @option == 'RealTime Embedded and Avionics Software'
      @sequence[:required] = Sequence.where(sequence_name: 'Required RealTime Embedded and Avionics Software').first
      @sequence[:one_of] = Sequence.where(sequence_name: 'OneOf RealTime Embedded and Avionics Software').first
    else
      @sequence[:general] = Sequence.where(sequence_name: 'General').first
    end
    getElectiveCourses
  end

  def getElectiveCourses ## Get a list of Electives that you can choose from. Add courses to :elective key in sequence variable
    if @sequence[:general].nil?
      electiveSequence = Sequence.new
      generalSequence = Sequence.where(sequence_name: 'General').first

      generalSequence.courses.each do |course|
        electiveSequence.courses.append(course)
      end
      @sequence.each do |sequence|
        sequence[1].courses.each do |course|
          if electiveSequence.courses.include?(course)
            electiveSequence.courses.delete(course)
          end
        end
      end
      @sequence[:electives] = electiveSequence
    end
  end

  def optionSelected # Verifies whether or not option has been selected by the user. Redirects to profile page if it has not been selected. Also assigns Global student variable
    user_id = current_user.user_id
    @student = Student.where(user_id: user_id).first
    option = @student.option
    if option.nil?
      flash[:notice] = 'Please select your desired option.'
      redirect_to profile_path
    end
  end

  def createDeepCopyOfSequence(sequenceMap) # used to create a deep copy of courses within the sequence. Prevents from modifying the database
    updatedSequence = {}
    sequenceMap.each do |sequence|
      updatedSequence[sequence[0]] = Sequence.new
      sequence[1].courses.each do |course|
        updatedSequence[sequence[0]].courses.append(course)
      end
    end
    return updatedSequence
  end

  def prereqsAreMet(id) # takes as input a course id and returns whether or not a student has taken the prereqs for that specific course
    prereq_relations = Course.find(id).courses_prereqs
    prereq_ids = []
    completedCourseIds = []
    prereq_relations.each do |prereq_relation|
      prereq_ids.append(prereq_relation.course_id_prereq)
    end
    studentCompletedCourses = @student.courses
    studentCompletedCourses.each do |course|
      completedCourseIds.append(course.course_id)
    end
    if prereq_relations.nil?
      return true
    else
      prereq_ids.each do |id|
        unless completedCourseIds.include?(id)
          return false
        end
      end
    end
    return true
  end
end
