json.borrows do
    json.array! @borrows, partial: "admin_system/borrows/borrow", as: :borrow
end