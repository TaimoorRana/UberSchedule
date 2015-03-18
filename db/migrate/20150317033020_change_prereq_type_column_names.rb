class ChangePrereqTypeColumnNames < ActiveRecord::Migration
  def change
    drop_table :prereq_types
  end
end
