class Collection < ApplicationRecord
    scope :active_collections, -> { where(active: true)}
end
