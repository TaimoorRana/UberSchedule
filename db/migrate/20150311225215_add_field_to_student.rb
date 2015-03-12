class AddFieldToStudent < ActiveRecord::Migration
  def change
    add_column :students, :option, :string
  end
end
