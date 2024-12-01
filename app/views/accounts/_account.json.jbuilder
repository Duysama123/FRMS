json.extract! account, :id, :username, :email, :password, :role, :created_at, :updated_at
json.url account_url(account, format: :json)
