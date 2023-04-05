class ReadingMaterial < ApplicationRecord
  belongs_to :material, polymorphic: true
  validates :material, :title, presence: true
  after_create :set_description

  def set_description
    if self.material_type == "Book"
      self.description = "#{self.title} #{self.material.author} #{self.material.isbn} #{self.material.dewey_decimal} #{self.material.issn}}"
    elsif self.material_type == "Magazine"
      self.description = "#{self.title} #{self.material.author} #{self.material.volume} #{self.material.issue}"
    end

    self.save
  end
end
