class SequenceGeneratorController < ApplicationController
before_action :generateSequence, only: [:Sequence]
  def Sequence

  end

  private
  def generateSequence
    specializationOption = $authorized_student.option
    @sequence = []
    @sequenceCourses = []
    if specializationOption == 'webServices'
      @sequence.append(Sequence.where(sequence_name: 'webServices'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    elsif specializationOption == 'computerGames'
      @sequence.append(Sequence.where(sequence_name: 'computerGames'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    elsif specializationOption == 'embeddedSystems'
      @sequence.append(Sequence.where(sequence_name: 'embeddedSystems'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    else
      @sequence.append(Sequence.where(sequence_name: 'general'))
      @sequence.append(Sequence.where(sequence_name: 'core'))
    end
    @sequence.each do |sequence|
      #some sort of SQL command to find the courses associated with the sequence block
      @sequenceCourses.append(sequence.course.all)
    end

  end
end
