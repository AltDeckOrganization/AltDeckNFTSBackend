class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :profile_image_path
      t.text :collection_image_path
      t.text :form_data
      t.boolean :active
      
      t.timestamps
    end
  end
end
