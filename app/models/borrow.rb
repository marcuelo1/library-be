class Borrow < ApplicationRecord
  belongs_to :reading_material
  has_many :request_extensions, dependent: :destroy
end
