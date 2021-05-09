class BooksController < ApplicationController
  def index
    @book=Book.new
    @user=User.find(current_user.id)
    @books=Book.all

  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
