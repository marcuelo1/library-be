class Magazine < ApplicationRecord
    validates :volume, :author, :issue, presence: true
    has_one :reading_material, as: :material, dependent: :destroy
end
