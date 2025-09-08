class CreateReservation < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :books
      t.string :user_email
      t.timestamps
    end
  end
end
