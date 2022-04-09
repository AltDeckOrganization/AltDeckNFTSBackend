class Drop < ApplicationRecord
    enum status: [:pending, :active, :disabled, :rejected]
end
