class AddColumnToLaunchpadStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :launchpad_statistics, :altdeck_revenue, :string
    add_column :launchpad_statistics, :total_revenue_generated, :string
  end
end
