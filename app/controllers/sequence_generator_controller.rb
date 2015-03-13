class SequenceGeneratorController < ApplicationController
before_action :generateSequence,:checkUserOption, only: [:Sequence]
  def Sequence

  end

  private
  def generateSequence
    @sequence = []
    @sequenceCourses = []
    if @option == 'webServices'
      @sequence.append(Sequence.where(sequence_name: 'webServices'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    elsif @option == 'computerGames'
      @sequence.append(Sequence.where(sequence_name: 'computerGames'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    elsif @option == 'embeddedSystems'
      @sequence.append(Sequence.where(sequence_name: 'embeddedSystems'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    else
      @sequence.append(Sequence.where(sequence_name: 'general'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    end
    @sequence.each do |sequence|
      #some sort of SQL command to find the courses associated with the sequence block


    end
  def checkUserOption
    user_id = session[:user_id]
    authorized_student = Student.where(user_id: user_id )
    @option = authorized_student.option
  end
  end
end
