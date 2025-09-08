require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books/:id/reserve" do
    it 'the reservation contains the email of the user' do
      post :books
    end
  end
end
