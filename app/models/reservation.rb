class Reservation < ApplicationRecord
  belongs_to :book

  validates :user_email, presence: true
  validates :book_id, uniqueness: { message: "is already reserved" }

  after_create :update_book_status

  private

  def update_book_status
    book.update!(status: "reserved")
  end
end
