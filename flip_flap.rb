require_relative 'tsv_buddy'
require_relative 'yaml_buddy'
require 'yaml'

class FlipFlap
  include TsvBuddy
  include YamlBuddy
end
