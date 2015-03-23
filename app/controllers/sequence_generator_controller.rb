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
    updatedSequence = createDeepCopyOfSequence(@sequence)
    params.each do |course_id|
      if course_id[1] == "1"
        updatedSequence.each do |sequence|
          sequence[1].courses.each do |course|
            if course.id == course_id[0].to_i
              updatedSequence[sequence[0]].courses.delete(course)
              @student.courses.append(course)

            end
          end

        end
      end

    end
    @sequence = updatedSequence
    flash[:notice] = "Courses Updated Successfully"
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
      @sequence[:general] = Sequence.where(sequence_name: 'general').first
    end
    getElectiveCourses
  end

  def getElectiveCourses
    if @sequence[:general].nil? ## Get a list of Electives that you can choose from. Add courses to :elective key in sequence variable
      electiveSequence = Sequence.new
      generalSequence = Sequence.where(sequence_name: 'general').first

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

  def optionSelected # Verifies whether or not option has been selected by the user. Redirects to profile page if it has not been selected
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

end
