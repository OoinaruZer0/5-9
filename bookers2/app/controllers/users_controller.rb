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
    if @book.edit
      flash[:edit] = "編集しました。"
      redirect_to books_path, :flash => {:error => "errorが起きました"}
  else
  	flash[:noedit] = ""
    redirect_to books_path, :flash => {:error => "errorが起きました"}
end
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
    redirect_to user_path(@user.id)
    else
	flash[:notice] = "introductionは50文字以内でお願いします"
    redirect_to edit_user_path, :flash => {:error => "errorが起きました"}
    end
  end

	private
		def user_params
		    params.require(:user).permit(:name, :profile_image, :introduction)

		end
end