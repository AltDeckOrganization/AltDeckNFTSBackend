class LaunchpadStatistic < ApplicationRecord
  belongs_to :launch

  validates :whitelist_mint_settings, presence: true
  validates :mint_price, presence: true
  validates :mint_currency, presence: true
end
