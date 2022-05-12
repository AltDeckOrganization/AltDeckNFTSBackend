class RemoveWalletAddressFromVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :wallet_address, :string
  end
end
