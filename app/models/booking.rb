class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # before_create  :checking_booking

  # def checking_booking
  #   booking = Booking.where("check_in >= ? AND check_out <= ?", self.check_in, self.check_out )
  #   if booking.present?
  #     # errors.add(:base, 'records cannot be destroyed')
  #     raise "Unable to remove business."
  #   end
  # end
end
