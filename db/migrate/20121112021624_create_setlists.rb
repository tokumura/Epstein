class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|

      t.timestamps
    end
  end
end
