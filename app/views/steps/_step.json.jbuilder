json.extract! step, :id, :recipe_id, :position, :instruction, :image, :video_url, :created_at, :updated_at
json.cook_method do
  json.extract! step.cook_method, :id, :name
end
json.url step_url(step, format: :json)
