class AddPageDataToLaunches < ActiveRecord::Migration[7.0]
  def change
    add_column :launches, :page_data, :text
  end
end
