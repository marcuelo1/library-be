class ReadingMaterial < ApplicationRecord
  belongs_to :material, polymorphic: true
  validates :material, :title, presence: true
  after_create :set_description
  has_many :borrows, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_all, against: :description,
    using: {
      tsearch: { prefix: true }
    }

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

  def self.search_books keyword
    ReadingMaterial.where(material_type: "Book").search_all(keyword).collect { |reading_material| reading_material.material }
  end

  def self.search_magazines keyword
    ReadingMaterial.where(material_type: "Magazine").search_all(keyword).collect { |reading_material| reading_material.material }
  end

  def self.search_e_books keyword
    ReadingMaterial.where(material_type: "EBook").search_all(keyword).collect { |reading_material| reading_material.material }
  end

  def self.search_theses keyword
    ReadingMaterial.where(material_type: "Thesis").search_all(keyword).collect { |reading_material| reading_material.material }
  end

  def self.search_newspapers keyword
    ReadingMaterial.where(material_type: "Newspaper").search_all(keyword).collect { |reading_material| reading_material.material }
  end
  
  def self.new_arrivals
    ReadingMaterial.order(created_at: :desc).first(10).collect { |reading_material| reading_material.material }
  end

  def self.featured
    ReadingMaterial.order("RANDOM()").first(10).collect { |reading_material| reading_material.material }
  end

  def is_borrowed?
    self.borrows.where(is_borrowed: true).any?
  end
end
