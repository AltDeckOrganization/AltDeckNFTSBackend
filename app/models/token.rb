class Token < ApplicationRecord
  enum status: [ :recent, :active, :disabled ]

  has_many :category

  validates :name, presence: true
  validates :date_created, presence: true
  validates :date_updated, presence: true
  validates :date_deleted, presence: true
  validates :blockchain, presence: true
  validates :votes, presence: true
end
