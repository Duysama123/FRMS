json.extract! recipe, :id, :title, :description, :instruction, :prep_time, :cook_time, :servings, :account_id, :image, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
