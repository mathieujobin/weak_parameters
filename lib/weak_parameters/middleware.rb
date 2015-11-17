module WeakParameters
  class Middleware
    def initialize(app)
      @app = app
    end
    def call(env)
      @app.call env
    rescue WeakParameters::ValidationError => exception
      [400, { "Content-Type" => "application/json; charset=utf-8" }, { result: false, error: exception}.to_json ]
    end
  end
end
