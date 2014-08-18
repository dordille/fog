module Fog
  module Compute
    class Terminal
      class Real
        def pause_terminal(container_key)
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => 'pause_terminal',
            :body     => {:container_key => container_key}
          )
        end
      end
    end
  end
end
