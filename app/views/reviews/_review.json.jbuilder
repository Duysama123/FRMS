json.extract! review, :id, :account_id, :recipe_id, :rating, :comment, :helpful_count, :created_at, :updated_at
json.url review_url(review, format: :json)
