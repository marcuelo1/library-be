json.magazines do
    json.array! @magazines, partial: "user_system/magazines/magazine", as: :magazine
end