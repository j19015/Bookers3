class BooksController < ApplicationController
    def create
       @book=current_user.books.new(book_params)
       @book.user_id=current_user.id
        if @book.save
            flash[:notice]="You have created book successfully."
            redirect_to book_path(@book.id)
        else
            @books=Book.all
            render "books/index"
        end
    end

    def edit
        @book=Book.find_by(id: params[:id])
        if @book.user.id==current_user.id
            nil
        else
            redirect_to books_path
        end
    end

    def update
        @book=Book.find_by(id: params[:id])
        if @book.update(book_params)
            flash[:notice]="You have updated book successfully."
            redirect_to book_path(@book.id)
        else
            render :edit
        end

    end

    def destroy
        @book=Book.find_by(id:params[:id])
        @book.destroy
        redirect_to books_path
    end

    def show
        @book=Book.new
        @book_id=Book.find_by(id: params[:id])
        @user=@book_id.user
        @book_comment=BookComment.new
    end

    def index
        @book=Book.new
        @books=Book.all
    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
