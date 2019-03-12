class CreateMicroposts < ActiveRecord::Migration[5.2]
  mount_uploader :image, ImageUploader
  
  def change
    create_table :microposts do |t|
      t.string :name
      t.string :image
      t.string :content

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
