class CreateTheses < ActiveRecord::Migration[6.1]
  def change
    create_table :theses do |t|
      t.string :author

      t.timestamps
    end
  end
end
