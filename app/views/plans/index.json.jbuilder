json.array!(@plans) do |plan|
  json.extract! plan, :id, :user_id, :act, :how_many, :deadline
  json.url plan_url(plan, format: :json)
end
