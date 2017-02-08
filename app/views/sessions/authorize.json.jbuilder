json.user do
  json.extract! @user, :id
end

json.token @token