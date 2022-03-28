class AddStatusToLaunches < ActiveRecord::Migration[7.0]
  def change
    add_column :launches, :status, :integer
  end
end
