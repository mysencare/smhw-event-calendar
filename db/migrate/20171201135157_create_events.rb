class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.string :description, null: false, default: ''
    end
  end
end
