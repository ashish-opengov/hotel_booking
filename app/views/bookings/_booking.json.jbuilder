json.extract! booking, :id, :user_id, :room_id, :check_in, :check_out, :created_at, :updated_at
json.url booking_url(booking, format: :json)
