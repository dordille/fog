module Fog
  module Compute
    class Terminal
      class Real
        def list_snapshots(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => 'list_snapshots'
          )
        end
      end
    end
  end
end
