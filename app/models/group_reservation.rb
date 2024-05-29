class GroupReservation < ApplicationRecord
  belongs_to :inn

  validates :name, :start_date, :end_date, presence: true
  validates :number_of_guests, numericality: { greater_than: 0 }
end
