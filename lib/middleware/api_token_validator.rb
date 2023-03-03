module Middleware
  class ApiTokenValidator
    def initialize(app)
      @app = app
      @api_token = PowermeterApi::Application.config.api_token
    end

    def call(env)
      if env['HTTP_AUTHORIZATION'] == "Bearer #{@api_token}"
        status, headers, response = @app.call(env)
        
        [status, headers, response]
      else
        [401, {}, {state: "ERROR", message: "Missing or incorrect api token"}.to_json ]
      end
    end
  end
end
