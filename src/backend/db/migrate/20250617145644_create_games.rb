class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.string :name, index: true
      t.string :box_art_url
      t.timestamps
    end
  end
end
