class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
    	t.string :name
    	t.string :compositor
    	t.string :symphony
    	t.text :introduction
    	t.integer :year
      t.timestamps
    end
  end
end
