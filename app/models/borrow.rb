class Borrow < ApplicationRecord
  belongs_to :reading_material
  has_many :request_extensions, dependent: :destroy

  def num_of_request_extensions
    request_extensions.where(status: "approved").count
  end
end
