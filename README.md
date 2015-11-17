# WeakParameters
Validates `params` in your sinatra app.

## Installation
```ruby
gem "weak_parameters"
```

## Usage

```ruby
# Sinatra
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

### Available options
* required
* only
* except
* handler

## Tips
WeakParameters.stats returns its validation metadata, and this is useful for auto-generating API documents.
With [autodoc](https://github.com/r7kamura/autodoc), you can auto-generate API documents with params information.

https://github.com/r7kamura/autodoc
