json.magazines do
    json.array! @magazines, partial: "admin_system/magazines/magazine", as: :magazine
end