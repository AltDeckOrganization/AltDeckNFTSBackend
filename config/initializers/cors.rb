Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      if Rails.env.development?
        origins 'http://localhost:3000', 'http://localhost:3001'
      else
        origins 'https://quirky-lewin-72018a.netlify.app', 'https://altdeck.io', 'https://www.altdeck.io', 'https://focused-wright-78670e.netlify.app', 'http://localhost:3000'
      end
      resource '*', headers: :any, methods: [:get, :post, :put, :delete]
    end
end