class Vote < ApplicationRecord
  belongs_to :token

  validates :vote_date, presence: true
end
