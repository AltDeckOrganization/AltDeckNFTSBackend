class AddTokenDetailToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :token_detail, :text
  end
end
