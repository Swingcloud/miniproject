class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
    	t.string :name
    	t.string :compositor
    	t.string :symphony
    	t.text :introduction
    	t.date :publish_year
    	t.datetime :on_shelf
    end
  end
end
