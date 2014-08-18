module Fog
  module Compute
    class Terminal
      class Real
        def restart_terminal(container_key)
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => 'restart_terminal',
            :body     => {:container_key => container_key}
          )
        end
      end
    end
  end
end
