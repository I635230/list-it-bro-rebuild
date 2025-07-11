class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.string :login
      t.string :display_name, index: true
      t.string :profile_image_url
      t.string :refresh_token
      t.timestamps
    end
  end
end
