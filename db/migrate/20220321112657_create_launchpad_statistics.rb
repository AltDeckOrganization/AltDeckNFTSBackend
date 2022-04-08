class CreateLaunchpadStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :launchpad_statistics do |t|
      t.references :launch, null: false, foreign_key: true
      t.text :whitelist_mint_settings
      t.integer :mint_price
      t.decimal :mint_currency

      t.timestamps
    end
  end
end
