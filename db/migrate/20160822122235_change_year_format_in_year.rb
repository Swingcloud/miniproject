class ChangeYearFormatInYear < ActiveRecord::Migration[5.0]
  def change
  	 change_column :musics, :year, :date
  end
end
