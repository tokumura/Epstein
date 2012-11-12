class AddNumberOfRingoToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :number_of_ringo, :integer
  end
end
