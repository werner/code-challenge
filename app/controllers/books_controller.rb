class BooksController < ApplicationController
  def reserve
    book = Book.find(params[:id])
    reservation = Reservation.create!(book: book, user_email: params[:user_email])
    reservation.book.status = "reserved"
    if book.save
      render json: :success, status: :ok
    else
      render json: :error, status: :unprocessable_entity
    end
  end
end
