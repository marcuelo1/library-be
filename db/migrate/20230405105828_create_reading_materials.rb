class CreateReadingMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :reading_materials do |t|
      t.string :title
      t.references :material, polymorphic: true, null: false

      t.timestamps
    end
  end
end
