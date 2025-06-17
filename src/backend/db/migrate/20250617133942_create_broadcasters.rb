class CreateBroadcasters < ActiveRecord::Migration[8.0]
  def change
    create_table :broadcasters, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.string :login
      t.string :display_name, index: true
      t.string :profile_image_url
      t.string :language
      t.timestamps
    end
  end
end
