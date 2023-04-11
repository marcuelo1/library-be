json.request_extensions do
  json.array! @request_extensions, partial: "admin_system/request_extensions/request_extension", as: :request_extension
end