json.extract! shopping_list, :id, :account_id, :recipe_id, :ingredient_id, :quantity, :unit, :purchased, :created_at, :updated_at
json.method shopping_list.method
json.image_url url_for(shopping_list.image) if shopping_list.image.attached?
json.url shopping_list_url(shopping_list, format: :json)
