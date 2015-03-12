class SequenceGeneratorController < ApplicationController
before_action :generateSequence, only: [:Sequence]
  def Sequence

  end

  private
  def generateSequence
    specializationOption = $authorized_student.option
    @sequence = []
    if specializationOption == 'webServices'
      @sequence.append(Course.where(option: 'webServices'))
      @sequence.append(Course.where(option: 'core'))
    elsif specializationOption == 'computerGames'
      @sequence.append(Course.where(option: 'computerGames'))
      @sequence.append(Course.where(option: 'core'))
    elsif specializationOption == 'embeddedSystems'
      @sequence.append(Course.where(option: 'embeddedSystems'))
      @sequence.append(Course.where(option: 'core'))
    else
      @sequence.append(Course.where(option: 'general'))
      @sequence.append(Course.where(option: 'core'))
    end

  end
end
