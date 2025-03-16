class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.bigint :attendee_id
      t.bigint :attended_event_id

      t.timestamps
    end

    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_event_id

    add_index :attendances, :attendee_id
    add_index :attendances, :attended_event_id
  end
end
