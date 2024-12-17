# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000' # Thay bằng URL frontend của bạn nếu khác
    resource '*', 
      headers: :any, 
      methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
