json.extract! nutrition_info, :id, :ingredient_id, :calories, :protein, :carbs, :fat, :sugar, :fiber, :created_at, :updated_at
json.url nutrition_info_url(nutrition_info, format: :json)