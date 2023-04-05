class EBook < ApplicationRecord
    validates :isbn, :author, :dewey_decimal, :issn, presence: true
    has_one :reading_material, as: :material, dependent: :destroy
end
