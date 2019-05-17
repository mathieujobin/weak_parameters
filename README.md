# WeakParameters [![Build Status](https://travis-ci.org/r7kamura/weak_parameters.svg?branch=master)](https://travis-ci.org/r7kamura/weak_parameters)
Validates `params` in your controllers.

## Installation
```ruby
gem "weak_parameters"
```

## WeakParameters provides `validates` class method to define validations.

### Rails
```ruby
class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: ["charlie", "dave"], strong: true
    integer :type, only: 1..3, strong: true
    string :quantity do |value|
      value =~ /\A\d+(?:\.\d+)g\z/
    end
    date :date, format: ["%Y/%m/%d", "%Y.%m.%d"]
    time :time, format: "%Y/%m/%d %H:%M:%S"
  end

  def create
    # pass the only parameters with strong option. like strong parameters.
    respond_with Recipe.create(permitted_params)
  end
end
```

### Sinatra
```ruby
require "weak_parameters"                                                                            |
require "weak_parameters/sinatra"                                                                    |

class App < Sinatra::Base
  WeakParameters::Rack.error_handler_register do |raised, env|
    [400, { "Content-Type" => "application/json; charset=utf-8" }, {result: false, error: raised}.to_json]
  end

  include WeakParameters::Sinatra
  use WeakParameters::Rack

  post 'recipes' do
    validates do
      string :name, required: true
      integer :type
    end

    Recipe.create(params).to_xml
  end
end
```

### Available validators
* any
* array
* float
* hash
* integer
* string
* boolean (= 0, 1, false, true)
* file
* object
* list
* date (= default %Y-%m-%d)
* time (= default %Y-%m-%d %H:%M:%S)

### Available options
* required
* only
* except
* handler
* strong
* format (only for date and time)

## Tips
WeakParameters.stats returns its validation metadata, and this is useful for auto-generating API documents.
With [autodoc](https://github.com/r7kamura/autodoc), you can auto-generate API documents with params information.

https://github.com/r7kamura/autodoc
