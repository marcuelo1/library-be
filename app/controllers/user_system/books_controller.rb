class UserSystem::BooksController < UserSystemController
    def index
        @books = Book.all
    end

    def create
        @book = Book.new(book_params)

        if @book.save
            render json: { message: "Book created successfully" }, status: 200
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        render json: { message: "Book deleted successfully" }, status: 200
    end

    def show
        @book = Book.find(params[:id])
    end

    private
    def book_params
        params.permit(:isbn, :author, :dewey_decimal, :issn)
    end
end