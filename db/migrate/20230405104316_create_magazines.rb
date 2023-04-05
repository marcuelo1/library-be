class CreateMagazines < ActiveRecord::Migration[6.1]
  def change
    create_table :magazines do |t|
      t.float :volume
      t.string :author
      t.integer :issue

      t.timestamps
    end
  end
end
