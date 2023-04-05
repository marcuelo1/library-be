json.books do
    json.array! @books, partial: "admin_system/books/book", as: :book
end