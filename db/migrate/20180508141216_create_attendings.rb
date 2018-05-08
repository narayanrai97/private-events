class CreateAttendings < ActiveRecord::Migration[5.1]
  def change
    create_table :attendings do |t|
      t.references :attendee, foreign_key: true
      t.references :attended_event, foreign_key: true

      t.timestamps
    end
  end
end
