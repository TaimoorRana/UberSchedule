class CreateCourseSequence < ActiveRecord::Migration
  def change
    create_table :courses_sequences, :id => false do |t|
      t.integer :course_id, :index => true
      t.integer :sequence_id, :index => true
    end
  end
end
