class ReadingMaterial < ApplicationRecord
  belongs_to :material, polymorphic: true
  validates :material, :title, presence: true
  after_create :set_description

  def set_description
    if self.material_type == "Book"
      self.description = "#{self.title} #{self.material.author} #{self.material.isbn} #{self.material.dewey_decimal} #{self.material.issn}}"
    elsif self.material_type == "Magazine"
      self.description = "#{self.title} #{self.material.author} #{self.material.volume} #{self.material.issue}"
    elsif self.material_type == "EBook"
      self.description = "#{self.title} #{self.material.author} #{self.material.isbn} #{self.material.dewey_decimal} #{self.material.issn}"
    elsif self.material_type == "Thesis"
      self.description = "#{self.title} #{self.material.author}"
    elsif self.material_type == "Newspaper"
      self.description = "#{self.title} #{self.material.publisher} #{self.material.issue_date}"
    end

    self.save
  end
end
