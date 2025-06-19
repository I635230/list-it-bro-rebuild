class CreatePlaylists < ActiveRecord::Migration[8.0]
  def change
    create_table :playlists do |t|
      t.string :slug, null: false
      t.string :title, index: true
      t.references :user, null: false, foreign_key: true
      t.string :search_keywords, index: true
      t.boolean :public, null: false, default: true
      t.timestamps
    end
    add_index :playlists, :slug, unique: true
    add_index :playlists, :created_at
  end
end
