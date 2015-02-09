class AddMyUrlToMovies < ActiveRecord::Migration
  	  
  def self.up
    change_table :movies do |t|
      t.string :my_url
    end
  end
  
  def self.down
  	  t.remove :my_url
  end

end

