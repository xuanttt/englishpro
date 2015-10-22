json.array!(@user_logs) do |user_log|
  json.extract! user_log, :id, :user_id, :act, :act_id, :status, :log_data
  json.url user_log_url(user_log, format: :json)
end
