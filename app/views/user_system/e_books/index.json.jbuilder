json.e_books do
    json.array! @e_books, partial: "admin_system/e_books/e_book", as: :e_book
end