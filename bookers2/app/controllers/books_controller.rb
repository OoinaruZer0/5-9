class BooksController < ApplicationController
  before_action :authenticate_user!,only: [:new,:edit,:update,:destroy,:index] 
  # except: [:top]
  def top

  end

  def new

  	  @book = Book.new
  end

  def create

  		@book = Book.new(book_params)
      @book.user_id = current_user.id
  		if @book.save
  		  # redirect_to book_path(@book.id)
        flash[:success] = "投稿が成功しました。"
        redirect_to books_path, :flash => {:error => "errorが起きました"}
      else
        flash[:notice] = "TitleとOpinionを入力してください。もしくは、Opinionは２００文字以内でお願いします"
        redirect_to books_path, :flash => {:error => "errorが起きました"}
      end
  end

  def index

  	@books = Book.all

  	@book = Book.new

  end

  def show

  	@bookf = Book.find(params[:id])
    @book = Book.new


  end

  def edit

  	@book = Book.find(params[:id])

  end

  def update
  	  @book = Book.find(params[:id])
      @book.update(book_params)
      flash[:edit] = "編集しました。"
      redirect_to books_path
  end

  def about

  end

  def destroy
  	  @book = Book.find(params[:id])
      if @book.destroy
      flash[:destroy] = "削除しました。"
      redirect_to books_path, :flash => {:error => "errorが起きました"}
      else
      flash[:nodestroy] = "削除しませんでした"
      redirect_to books_path, :flash => {:error => "errorが起きました"}
  end
end

  		 private

    	def book_params
        	params.require(:book).permit(:title, :body)

    	end
end
