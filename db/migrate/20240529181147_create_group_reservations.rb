class CreateGroupReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_reservations do |t|
      t.references :inn, null: false, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
