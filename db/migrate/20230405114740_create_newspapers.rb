class CreateNewspapers < ActiveRecord::Migration[6.1]
  def change
    create_table :newspapers do |t|
      t.string :publisher
      t.date :issue_date

      t.timestamps
    end
  end
end
