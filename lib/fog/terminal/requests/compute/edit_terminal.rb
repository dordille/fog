module Fog
  module Compute
    class Terminal
      class Real
        def edit_terminal(container_key, options={})
          options[:container_key] ||= container_key
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => 'edit_terminal',
            :body     => options
          )
        end
      end
    end
  end
end
