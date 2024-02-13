module BookingsHelper
    def options_for_room
        @room = Room.pluck(:number, :id)
    end

    def total_price(check_in_date, check_out_date)
        # Assuming room price is stored in a variable or retrieved from the database
        room_price = 1000 # Replace 100 with the actual room price
        price_hash = {}

        # Calculate the number of days between check-in and check-out dates
        num_days = (check_out_date - check_in_date).to_i

        # Calculate the total price
        total_price = room_price  * num_days

        # Return the total price
        price_hash[:amount] = total_price
        price_hash[:days] = num_days
        price_hash
    end
end
