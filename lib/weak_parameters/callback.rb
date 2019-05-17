module WeakParameters
  class Callbacks
    def self.register &block
      @callbacks = block
    end

    def self.call raised, env
      @callbacks.call(raised, env)
    end
  end

  class Rack
    def initialize(app)
      @app = app
    end
    
    def self.error_handler_register &block
      if block_given?
        Callbacks.register &block
      end
    end

    def call(env)
      response = @app.call(env)
    rescue WeakParameters::ValidationError => exception
      res = Callbacks.call(exception, env)
    end
  end
end
