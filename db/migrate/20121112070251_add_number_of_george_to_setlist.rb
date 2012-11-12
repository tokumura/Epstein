class AddNumberOfGeorgeToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :number_of_george, :integer
  end
end
