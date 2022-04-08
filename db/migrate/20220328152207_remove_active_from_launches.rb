class RemoveActiveFromLaunches < ActiveRecord::Migration[7.0]
  def change
    remove_column :launches, :active, :boolean
  end
end
