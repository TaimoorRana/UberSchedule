class CreatePrereqTypes < ActiveRecord::Migration
  def change
    create_table :prereq_types do |t|
      t.string 'prereq_type'
      t.timestamps null: false
    end
  end
end
