json.categories @categories do |category|
  json.id category.friendly_id
  json.name category.name
  json.code category.code
  json.devices category.device_ids
end
