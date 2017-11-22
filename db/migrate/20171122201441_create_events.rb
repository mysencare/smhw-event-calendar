class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
