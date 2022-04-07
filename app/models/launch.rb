class Launch < ApplicationRecord
    # scope :active_launches, -> { where(active: true)}
    enum status: [:pending, :active, :completed, :disabled]
end
