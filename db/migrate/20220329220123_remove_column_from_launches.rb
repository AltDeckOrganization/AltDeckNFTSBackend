class RemoveColumnFromLaunches < ActiveRecord::Migration[7.0]
  def change
    remove_column :launches, :altdeck_revenue, :string
    remove_column :launches, :total_revenue_generated, :string
  end
end
