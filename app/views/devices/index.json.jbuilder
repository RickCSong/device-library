json.devices @devices do |device|
  json.id device.id
  json.hardware device.hardware
  json.operatingSystem device.operating_system
  json.storageCode device.storage_code
  json.barcode device.barcode
  json.details device.details
  json.status device.status
  json.user device.user_id
  json.category device.category_id
  json.activities device.activity_ids
end
