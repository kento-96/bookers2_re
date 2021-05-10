class BooksController < ApplicationController
   before_action :authenticate_user!

  before_action :current_user,only:[:edit,:update]

  def index
    @book=Book.new
    @user=User.find(current_user.id)
    @books=Book.all

  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @user=User.find(current_user.id)
    @books=Book.all
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render:index
    end
  end

  def show
     @book=Book.find(params[:id])
    @user=User.find(@book.user_id)
    @new=Book.new
    @books=Book.all
     @book_comment=BookComment.new
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
      render"edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'Book was successfully  updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

 private
 def book_params
   params.require(:book).permit(:title,:body)
 end
end
