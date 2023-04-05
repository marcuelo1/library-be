json.theses do
    json.array! @theses, partial: "user_system/theses/thesis", as: :thesis
end