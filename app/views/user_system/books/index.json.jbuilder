json.books do
    json.array! @books, partial: "user_system/books/book", as: :book
end