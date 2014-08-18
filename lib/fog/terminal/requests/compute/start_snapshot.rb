module Fog
  module Compute
    class Terminal
      class Real
        def start_snapshot(snapshot_id, options={})
          options[:snapshot_id] ||= snapshot_id
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => 'start_snapshot',
            :body     => options
          )
        end
      end
    end
  end
end
