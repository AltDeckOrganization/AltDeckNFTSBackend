class CreateLaunches < ActiveRecord::Migration[7.0]
  def change
    create_table :launches do |t|
      t.string :name
      t.text :profile_image_path
      t.text :collection_image_path
      t.text :form_data
      t.string :candymachine_id, null: true
      t.boolean :active

      t.timestamps
    end
  end
end
