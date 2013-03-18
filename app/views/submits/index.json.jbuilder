json.array!(@submits) do |submit|
  json.extract! submit, :select_item_id, :judge_id
  json.url submit_url(submit, format: :json)
end