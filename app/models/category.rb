class Category < ApplicationRecord
  belongs_to :token

  validates :name, presence: true
end
