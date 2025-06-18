class CreateClips < ActiveRecord::Migration[8.0]
  def change
    create_table :clips do |t|
      t.string :slug, null: false
      t.references :broadcaster, null: false, foreign_key: true
      t.string :broadcaster_name
      t.integer :creator_id
      t.string :creator_name
      t.references :game, null: false, foreign_key: true
      t.string :language
      t.string :title, index: true
      t.datetime :clip_created_at, index: true
      t.string :thumbnail_url
      t.float :duration
      t.integer :view_count, index: true
      t.string :search_keywords, index: true
      t.timestamps
    end
    add_index :clips, :slug, unique: true
  end
end
