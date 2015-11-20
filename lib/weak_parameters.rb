require "active_support/hash_with_indifferent_access"
require "active_support"
require 'active_support/core_ext/object/blank'


require "weak_parameters/base_validator"
require "weak_parameters/any_validator"
require "weak_parameters/array_validator"
require "weak_parameters/boolean_validator"
#require "weak_parameters/file_validator"
require "weak_parameters/float_validator"
require "weak_parameters/hash_validator"
require "weak_parameters/integer_validator"
require "weak_parameters/string_validator"
require "weak_parameters/object_validator"
require "weak_parameters/list_validator"
require "weak_parameters/controller"
require "weak_parameters/validation_error"
require "weak_parameters/validator"
require "weak_parameters/version"

module WeakParameters
  def self.stats
    @stats ||= ActiveSupport::HashWithIndifferentAccess.new do |hash, key|
      hash[key] = ActiveSupport::HashWithIndifferentAccess.new
    end
  end
end
