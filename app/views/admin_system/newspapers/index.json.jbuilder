json.newspapers do
    json.array! @newspapers, partial: "admin_system/newspapers/newspaper", as: :newspaper
end