class RemoveDateDeletedFromTokens < ActiveRecord::Migration[7.0]
  def change
    remove_column :tokens, :date_deleted, :timestamp
  end
end
