json.extract! shopping_list, :id, :account_id, :recipe_id, :ingredient_id, :quantity, :unit, :purchased, :created_at, :updated_at
json.url shopping_list_url(shopping_list, format: :json)
