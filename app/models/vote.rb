class Vote < ApplicationRecord
  belongs_to :token

  validates :wallet_address, presence: true
  validates :vote_date, presence: true
end
