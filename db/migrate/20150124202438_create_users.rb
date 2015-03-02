class CreateUsers < ActiveRecord::Migration
  
  #create a table
  def up
    create_table :users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      t.timestamps 
    end
  end
  
  ## delete the table
  def down
    drop_table :users
  end
end
