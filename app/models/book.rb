class Book < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: %w[available reserved checked_out] }

  def available?
    status == "available"
  end

  def reserved?
    status == "reserved"
  end
end
