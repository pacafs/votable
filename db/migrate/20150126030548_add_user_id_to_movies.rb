class AddUserIdToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.integer :user_id
    end
  end
  
  def self.down
  	  t.remove :user_id
  end

end
