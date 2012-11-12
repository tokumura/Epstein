class AddNumberOfSongsToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :number_of_songs, :integer
  end
end
