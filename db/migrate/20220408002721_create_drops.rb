class CreateDrops < ActiveRecord::Migration[7.0]
  def change
    create_table :drops do |t|
      t.string :name
      t.text :form_data
      t.text :profile_image_path
      t.integer :status
      t.timestamps
    end
  end
end
