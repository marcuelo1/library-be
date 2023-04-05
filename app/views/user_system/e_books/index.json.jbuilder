json.e_books do
    json.array! @e_books, partial: "user_system/e_books/e_book", as: :e_book
end