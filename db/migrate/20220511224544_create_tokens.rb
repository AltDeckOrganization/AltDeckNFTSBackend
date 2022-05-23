class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :name
      t.string :blockchain
      t.integer :votes, :integer, :default => 0
      t.integer :status
      t.text :token_detail

      t.timestamps
    end
  end
end
