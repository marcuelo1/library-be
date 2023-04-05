class Newspaper < ApplicationRecord
    validates :publisher, :issue_date, presence: true
    has_one :reading_material, as: :material, dependent: :destroy
end
