json.theses do
    json.array! @theses, partial: "admin_system/theses/thesis", as: :thesis
end