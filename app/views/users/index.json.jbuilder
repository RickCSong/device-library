json.users @users do |user|
  json.id user.id
  json.username user.username
  json.firstName user.first_name
  json.lastName user.last_name
  json.devices user.device_ids
end
