require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books/:id/reserve" do
    let (:book) { create(:book) }
    before(:each) { post(reserve_book_path(book.id), params: { user_email: 'john@doe.com' }) }
    it 'the reservation contains the email of the user' do
      expect(Reservation.last.user_email).not_to be_nil
    end
    it 'the book status change to reserved' do
      expect(book.reload.status).to eq('reserved')
    end
    it 'if book is already reserved, shows an error' do
      post(reserve_book_path(book.id), params: { user_email: 'maria@doe.com' })
      expect(response.status).to eq(422)
    end
  end
end
