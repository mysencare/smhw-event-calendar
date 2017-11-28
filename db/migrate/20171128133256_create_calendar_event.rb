class CreateCalendarEvent < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.string :subject
      t.string :teacher
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
