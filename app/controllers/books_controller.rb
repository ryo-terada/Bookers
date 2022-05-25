class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
      else
        flash.now[:error] = @book.errors
        render :index
      end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      redirect_to book_path(params[:id]),notice:"successfully"
    else
      render:edit,notice:"errors"
    end
  end
  
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "successfully"
  	redirect_to books_path(@book)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
