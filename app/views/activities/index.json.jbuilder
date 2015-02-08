json.activities @activities do |activity|
  json.id activity.id
  json.status_from activity.status_from
  json.status_to activity.status_to
  json.user activity.user_id
  json.device activity.device_id
  json.created_at activity.created_at
end
