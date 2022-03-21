class LaunchpadStatistic < ApplicationRecord
  # include ActionView::Helpers::NumberHelper

  belongs_to :launch

  validates :whitelist_mint_settings, presence: true
  validates :mint_price, presence: true
  validates :mint_currency, presence: true
  # number_with_precision(:mint_currency, precision: 4)
end
