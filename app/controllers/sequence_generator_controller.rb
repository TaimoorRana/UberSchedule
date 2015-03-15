class SequenceGeneratorController < ApplicationController
before_action :confirm_logged_in,:checkUserOption,:generateSequence, only: [:Sequence]
  def Sequence

  end

  private
  def generateSequence
    user_id = session[:user_id]
    authorized_student = Student.where(user_id: user_id )
    option = authorized_student.option

    @sequence = []
    @sequenceCourses = []
    if option == 'webServices'
      @sequence.append(Sequence.where(sequence_name: 'webServices'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    elsif option == 'computerGames'
      @sequence.append(Sequence.where(sequence_name: 'computerGames'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    elsif option == 'embeddedSystems'
      @sequence.append(Sequence.where(sequence_name: 'embeddedSystems'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    else
      @sequence.append(Sequence.where(sequence_name: 'general'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    end
    @sequence.each do |sequence|
      sequence.courses.each do |course|
        @sequence.append(course)
      end
    end

  end
end
