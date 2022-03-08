Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      if Rails.env.development?
        origins 'http://localhost:3000'
      else
        origins 'https://aqueous-dawn-46734.herokuapp.com'
      end
      resource '*', headers: :any, methods: [:get, :post, :put, :delete]
    end
end