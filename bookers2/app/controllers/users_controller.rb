class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	# book.user_id = current_user.id
    # book.save
    # redirect_to book_path(book.id)
  	# @books = Book.all
  	@books = @user.books.page(params[:page])

  end

  def users
  	@book = Book.new
  	@users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

	private
		def user_params
		    params.require(:user).permit(:name, :profile_image, :introduction)

		end
end