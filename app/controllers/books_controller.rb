class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
		@users = User.all
		@user = User.find(current_user.id)
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
		@user = @books.user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
            redirect_to '/books', notice:"You have created user successfully."
        else
        	redirect_to '/books', notice: 'errors prohibited this book from being saved:'
        end
	end

	def edit
  		@book = Book.find(params[:id])
	end

	def update
  		@book = Book.find(params[:id])
  		if @book.update(book_params)
	    	redirect_to book_path(@book.id), notice:"You have updated user successfully."
	    else
	    	render :edit, notice: 'errors prohibited this book from being saved:'
	    end
  	end

	def destroy
 		book = Book.find(params[:id])
 		book.destroy
 		redirect_to "/books", notice:'Book was successfully destroyed.'
	end

	private

    def book_params
        params.require(:book).permit(:title, :body)
    end

end
