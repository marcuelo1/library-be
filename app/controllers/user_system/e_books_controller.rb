class UserSystem::EBooksController < UserSystemController
    def index
        @e_books = EBook.all
    end

    def show
        @e_book = EBook.find(params[:id])
    end
end