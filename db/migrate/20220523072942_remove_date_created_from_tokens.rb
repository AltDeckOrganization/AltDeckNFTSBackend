class RemoveDateCreatedFromTokens < ActiveRecord::Migration[7.0]
  def change
    remove_column :tokens, :date_created, :timestamp
  end
end
