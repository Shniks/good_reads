require 'rails_helper'

describe 'As a User' do
  describe 'When I visit a book\'s show page' do
    before(:each) do
      @book = Book.create!(title: 'Harry Potter')
      @user_1 = @book.users.create!(name: 'Nikhil')
      @user_2 = @book.users.create!(name: 'Sergio')
      @review_1 = @book.reviews.create!(body: 'body1', rating: 1, user_id: @user_1.id)
      @review_2 = @book.reviews.create!(body: 'body2', rating: 3, user_id: @user_2.id)
    end

    scenario 'I can see the book title, list of review, username, body and rating for that book' do

      visit book_path(@book)

      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@user_2.name)
      expect(page).to have_content(@book.title)
      expect(page).to have_content(@review_1.body)
      expect(page).to have_content(@review_1.rating)
      expect(page).to have_content(@review_2.body)
      expect(page).to have_content(@review_2.rating)
    end

    scenario 'I can see the average rating for that book' do

      visit book_path(@book)

      expect(page).to have_content(@book.average_rating)
    end
  end
end
