class SequenceGeneratorController < ApplicationController
  layout 'general_schedule'
before_action :authenticate_user!,:generateSequence, only: [:Sequence]
  def Sequence

  end

  private
  def generateSequence ## Private Method to generate an option for specific sequences
    user_id = current_user.user_id
    option = Student.where(user_id: user_id ).first.option


    @sequence = {} # Store each sequence group in a hashmap.
    @sequence[:core] = Sequence.where(sequence_name: 'Software Engineering Core').first
    if option == 'Web Services and Applications'
      @sequence[:required] = Sequence.where(sequence_name: 'Required Web Services and Applications').first
      @sequence[:one_of] =  Sequence.where(sequence_name: 'OneOf Web Services and Applications').first
    elsif option == 'Computer Games'
      @sequence[:required] = Sequence.where(sequence_name: 'Required Computer Games').first
      @sequence[:one_of] =  Sequence.where(sequence_name: 'OneOf Computer Games').first
    elsif option == 'RealTime Embedded and Avionics Software'
      @sequence[:required] = Sequence.where(sequence_name: 'Required RealTime Embedded and Avionics Software').first
      @sequence[:one_of] =  Sequence.where(sequence_name: 'OneOf RealTime Embedded and Avionics Software').first
    else
      @sequence[:general] = Sequence.where(sequence_name: 'general').first
    end
    @sequenceCourses = []
    @sequence.each do |sequence|
      sequence.courses.each do |course|
        @sequenceCourses.append(course)
      end
    end

  end
end
