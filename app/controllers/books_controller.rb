class BooksController < ApplicationController
  def reserve
    book = Book.find_by(id: params[:id])

    if book.nil?
      render json: { error: "Book not found" }, status: :not_found
      return
    end

    if params[:user_email].blank?
      render json: { error: "User email is required" }, status: :unprocessable_content
      return
    end

    unless book.available?
     render json: { error: "Book is not available for reservation" }, status: :unprocessable_content
     return
    end

    reservation = Reservation.new(book: book, user_email: params[:user_email])

    if reservation.save
      render json: { message: "Book reserved successfully" }, status: :ok
    else
      render json: { error: "Failed to create reservation", status: :unprocessable_content }
    end
  end
end
