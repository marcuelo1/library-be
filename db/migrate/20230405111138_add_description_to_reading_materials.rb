class AddDescriptionToReadingMaterials < ActiveRecord::Migration[6.1]
  def change
    add_column :reading_materials, :description, :text
  end
end
