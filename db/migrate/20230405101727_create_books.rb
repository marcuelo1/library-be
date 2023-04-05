class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :author
      t.string :dewey_decimal
      t.string :issn

      t.timestamps
    end
  end
end
