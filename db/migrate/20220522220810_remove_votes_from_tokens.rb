class RemoveVotesFromTokens < ActiveRecord::Migration[7.0]
  def change
    remove_column :tokens, :votes, :integer
  end
end
