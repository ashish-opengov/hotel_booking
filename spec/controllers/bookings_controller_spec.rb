require 'rails_helper'

RSpec.describe BookingsController, type: :controller do

  let(:invalid_attributes) {
    { user_id: nil, room_id: nil, check_in: nil, check_out: nil }
  }

  let(:valid_attributes) {
    hotel = Hotel.create!(name: 'Test Hotel')  
    user = User.create!(name: 'Test User')
    room = Room.create!(number: '101', hotel_id:hotel.id)
    { user_id: user.id, room_id: room.id, check_in: Date.today, check_out: Date.today + 1 }
  }

  describe "GET #index" do
    it "returns a success response" do
      booking = Booking.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      booking = Booking.create! valid_attributes
      get :show, params: { id: booking.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      booking = Booking.create! valid_attributes
      get :edit, params: { id: booking.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Booking" do
        expect {
          post :create, params: { booking: valid_attributes }
        }.to change(Booking, :count).by(1)
      end

      it "redirects to the created booking" do
        post :create, params: { booking: valid_attributes }
        expect(response).to redirect_to(booking_path(Booking.last))
      end
    end

    context "with invalid params" do
      it "renders the new template with errors" do
        post :create, params: { booking: invalid_attributes }
        expect(response).to render_template(:new)
        expect(assigns(:booking).errors).not_to be_empty
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { check_in: Date.today + 1 }
      }

      it "updates the requested booking" do
        booking = Booking.create! valid_attributes
        put :update, params: { id: booking.to_param, booking: new_attributes }
        booking.reload
        expect(booking.check_in).to eq(new_attributes[:check_in])
      end

      it "redirects to the booking" do
        booking = Booking.create! valid_attributes
        put :update, params: { id: booking.to_param, booking: valid_attributes }
        expect(response).to redirect_to(booking_path(booking))
      end
    end

    context "with invalid params" do
      it "renders the edit template with errors" do
        booking = Booking.create! valid_attributes
        put :update, params: { id: booking.to_param, booking: invalid_attributes }
        expect(response).to render_template(:edit)
        expect(assigns(:booking).errors).not_to be_empty
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested booking" do
      booking = Booking.create! valid_attributes
      expect {
        delete :destroy, params: { id: booking.to_param }
      }.to change(Booking, :count).by(-1)
    end

    it "redirects to the bookings list" do
      booking = Booking.create! valid_attributes
      delete :destroy, params: { id: booking.to_param }
      expect(response).to redirect_to(bookings_url)
    end
  end
end