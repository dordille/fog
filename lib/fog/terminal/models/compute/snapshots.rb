require 'fog/core/collection'
require 'fog/terminal/models/compute/snapshot'

module Fog
  module Compute
    class Terminal
      class Images < Fog::Collection
        model Fog::Compute::Terminal::Snapshot

        def all
          load service.list_snapshots.body['snapshots']
        end

        def get(snapshot_id)
          all.find { |f| f.id == id }
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
