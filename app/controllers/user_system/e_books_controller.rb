class UserSystem::EBooksController < UserSystemController
    def index
        @e_books = EBook.all
    end

    def create
        EBook.transaction do
            @e_book = EBook.new(e_book_params)
            @e_book.save!
            reading_material = ReadingMaterial.new(title: params[:title], material: @e_book)
            reading_material.save!

            render json: { message: "EBook created successfully" }, status: 200
        rescue => e
            render json: { message: e.message }, status: :unprocessable_entity
        end
    end

    def show
        @e_book = EBook.find(params[:id])
    end

    def destroy
        @e_book = EBook.find(params[:id])
        @e_book.destroy
        render json: { message: "EBook deleted successfully" }, status: 200
    end

    private
    def e_book_params
        params.permit(:isbn, :author, :dewey_decimal, :issn)
    end
    
end