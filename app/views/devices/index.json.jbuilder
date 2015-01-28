json.devices @devices do |device|
  json.id device.id
  json.hardware device.hardware
  json.operating_system device.operating_system
  json.storage_code device.storage_code
  json.barcode device.barcode
  json.details device.details
  json.status device.status
  json.user device.user_id
  json.category device.category_id
end
