class AdminSystem::BooksController < AdminSystemController
    def index
        @books = Book.all
    end

    def create
        Book.transaction do
            @book = Book.new(book_params)
            @book.save!
            reading_material = ReadingMaterial.new(title: params[:title], material: @book)
            reading_material.save!
            
            render json: { message: "Book created successfully" }, status: 200
        rescue => e
            render json: { message: e.message }, status: :unprocessable_entity
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