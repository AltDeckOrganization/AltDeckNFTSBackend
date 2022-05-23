class Token < ApplicationRecord
  enum status: [ :recent, :active, :disabled ]

  has_many :category

  validates :name, presence: true
  validates :blockchain, presence: true
  validates :votes, presence: true
end
