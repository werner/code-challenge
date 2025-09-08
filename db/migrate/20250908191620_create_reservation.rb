class CreateReservation < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :book
      t.string :user_email
      t.timestamps
    end
  end
end
