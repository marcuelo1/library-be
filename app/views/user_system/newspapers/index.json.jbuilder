json.newspapers do
    json.array! @newspapers, partial: "user_system/newspapers/newspaper", as: :newspaper
end