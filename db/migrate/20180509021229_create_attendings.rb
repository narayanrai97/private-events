class CreateAttendings < ActiveRecord::Migration[5.1]
  def change
    create_table :attendings do |t|
      t.integer  :attendee_id
      t.integer  :attended_event_id

      t.timestamps
    end
  end
end
