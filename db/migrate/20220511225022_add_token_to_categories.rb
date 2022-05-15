class AddTokenToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :token, null: false, foreign_key: true
  end
end
