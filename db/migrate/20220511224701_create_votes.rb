class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.string :wallet_address
      t.timestamp :vote_date

      t.timestamps
    end
  end
end
