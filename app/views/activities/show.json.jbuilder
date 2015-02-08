json.activity do
  json.id @activity.id
  json.statusFrom @activity.status_from
  json.statusTo @activity.status_to
  json.user @activity.user_id
  json.device @activity.device_id
  json.createdAt @activity.created_at
end
