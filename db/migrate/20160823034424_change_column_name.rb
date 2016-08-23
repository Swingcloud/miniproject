class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :musics, :year, :publish_year
  end
end
