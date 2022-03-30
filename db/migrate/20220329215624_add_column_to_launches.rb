class AddColumnToLaunches < ActiveRecord::Migration[7.0]
  def change
    add_column :launches, :altdeck_revenue, :string
    add_column :launches, :total_revenue_generated, :string
  end
end
