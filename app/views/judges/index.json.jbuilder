json.array!(@judges) do |judge|
  json.extract! judge, :title, :select_type, :judge_type, :judge_time, :remove_time
  json.url judge_url(judge, format: :json)
end