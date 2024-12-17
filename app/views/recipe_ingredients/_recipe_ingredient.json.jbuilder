json.extract! recipe_ingredient, :id, :recipe_id, :ingredient_id, :quantity, :unit, :optional, :created_at, :updated_at
json.url recipe_ingredient_url(recipe_ingredient, format: :json)

# Thêm phương pháp nấu ăn (method)
json.method recipe_ingredient.cook_method.present? ? recipe_ingredient.cook_method.name : 'N/A'


# Thêm image URL
json.image recipe_ingredient.image.attached? ? url_for(recipe_ingredient.image) : nil