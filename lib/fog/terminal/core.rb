require 'fog/core'
require 'fog/json'

module Fog
  module Terminal
    extend Fog::Provider
    service(:compute, 'Compute')
  end
end