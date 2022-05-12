class AddTokenToVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :votes, :token, null: false, foreign_key: true
  end
end
