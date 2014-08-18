require 'fog/compute/models/server'

module Fog
  module Compute
    class Terminal
      class Server < Fog::Compute::Server
        identity :container_key

        attribute :cpu
        attribute :ram
        attribute :diskspace
        attribute :name
        attribute :snapshot_id
        attribute :temporary
        attribute :mount_home
        attribute :status
        attribute :allow_spot
        attribute :hostname
        attribute :subdomain
        attribute :creation_time
        attribute :ctid

        def initialize(attributes={})
          self.cpu ||= 2
          self.ram ||= 256
          self.diskspace ||= 10
        end

        def delete
          requires :container_key
          service.delete_terminal(container_key)
          true
        end

        def pause
          requires :container_key
          service.pause_terminal(container_key)
          true
        end

        def resume
          requires :container_key
          service.resume_terminal(container_key)
          true
        end

        def restart
          requires :container_key
          serice.restart_terminal(container_key)
          true
        end

        def snapshot
          requires :snapshot_id
          service.snapshots.get(snapshot_id)
        end

        def save(options = {})
          raise Fog::Errors::Error.new('Resaving an existing object may create a duplicate') if persisted?
          requires :snapshot_id
          data = service.create_server(snapshot_id, options)

          # merge_attributes(data.body['server'])
          true
        end

        def setup(credentials = {})

        end

      end
    end
  end
end