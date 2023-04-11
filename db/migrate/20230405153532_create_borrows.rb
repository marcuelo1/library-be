class CreateBorrows < ActiveRecord::Migration[6.1]
  def change
    create_table :borrows do |t|
      t.references :reading_material, null: false, foreign_key: true
      t.date :date
      t.date :due_date
      t.boolean :is_borrowed, default: true

      t.timestamps
    end
  end
end
