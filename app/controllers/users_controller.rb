class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :current_user, only: [:edit,:update]

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def create
  end

  def show
    @new=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
     @user =User.find(params[:id])
    if @user == current_user
      render"edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = 'You have updated user successfully.'
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

 def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)
 end
end
