class RemoveDateUpdatedFromTokens < ActiveRecord::Migration[7.0]
  def change
    remove_column :tokens, :date_updated, :timestamp
  end
end
