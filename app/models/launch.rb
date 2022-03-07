class Launch < ApplicationRecord
    scope :active_launches, -> { where(active: true)}
end
