class Thesis < ApplicationRecord
    validates :author, presence: true
    has_one :reading_material, as: :material, dependent: :destroy
end
