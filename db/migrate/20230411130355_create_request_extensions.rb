class CreateRequestExtensions < ActiveRecord::Migration[6.1]
  def change
    create_table :request_extensions do |t|
      t.references :borrow, null: false, foreign_key: true
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
