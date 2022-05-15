class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :name
      t.timestamp :date_created
      t.timestamp :date_updated
      t.timestamp :date_deleted
      t.string :blockchain
      t.integer :votes

      t.timestamps
    end
  end
end
