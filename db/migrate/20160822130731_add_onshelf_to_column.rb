class AddOnshelfToColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :musics, :on_shelf, :datetime
  end
end
