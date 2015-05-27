class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :hair_size
      t.string :hair_color
      t.datetime :date_request
      t.datetime :date_marked
      t.date :date_send
      t.string :observation
      t.string :status
      t.integer :service_id
      t.integer :professional_id
      t.integer :user_id

      t.timestamps
    end
  end
end
