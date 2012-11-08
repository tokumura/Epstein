class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.string :vocal
      t.boolean :solo
      t.boolean :first
      t.boolean :last
      t.boolean :piano

      t.timestamps
    end
  end
end
