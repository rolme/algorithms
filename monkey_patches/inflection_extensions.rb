module ActiveSupport
  module Inflector
    extend self

    # Public: Keep existing functionality while adding converting *space* to *underscore*.
    #
    # Examples
    #   "CamelCase".underscore             # => "camel_case"
    #   "Api::AssetController".underscore  # => "api/asset_controller"
    #   "In the Mix".underscore            # => "in_the_mix"
    #
    # Returns String.
    @old_underscore = instance_method(:underscore)

    define_method(:underscore) do |s|
      word = @old_underscore.bind(self).(s)
      word.tr!(" ", "_")
      word
    end
  end
end
