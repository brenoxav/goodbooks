class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 15
      t.string :full_name
      t.string :photo
      t.string :cover_image

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
