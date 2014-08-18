module Fog
  module Compute
    class Terminal
      class Real
        def delete_terminal(container_key)
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => 'delete_terminal',
            :body     => {:container_key => container_key}
          )
        end
      end
    end
  end
end
