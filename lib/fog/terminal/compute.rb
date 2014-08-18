require 'fog/terminal/core'

module Fog
  module Compute
    class Terminal < Fog::Service
      requires      :terminal_user_token
      requires      :terminal_access_token

      recognizes    :terminal_api_url

      model_path    'fog/terminal/models/compute'
      # model         :server
      # collection    :servers
      # model         :flavor
      # collection    :flavors
      model         :snapshot
      collection    :snapshots

      request_path  'fog/terminal/requests/compute'
      # request       :list_flavors
      # request       :start_snapshot
      # request       :delete_terminal
      # request       :restart_terminal
      # request       :pause_terminal
      # request       :resume_terminal
      # request       :edit_terminal
      request       :list_snapshots
      request       :start_snapshot

      class Real
        def initialize(options={})
          @terminal_user_token   = options[:terminal_user_token]
          @terminal_access_token = options[:terminal_access_token]
          @terminal_api_url      = options[:terminal_api_url] || "https://api.terminal.com/v0.1"
          @connection            = Fog::Core::Connection.new(@terminal_api_url)
        end

        def reload
          @connection.reset
        end

        def headers(options={})
          { 'Content-Type' => 'application/json',
            'Accept' => 'application/json'
          }.merge(options[:headers] || {})
        end

        def request_params(params={})
          params.merge({
            :headers  => headers(params),
            :path     => "v0.1/#{params[:path]}",
            :body     => Fog::JSON.encode(params[:body].merge({
              :user_token => @terminal_user_token,
              :access_token => @terminal_access_token
            }))
          })
        end

        def request(params, parse_json = true)
          params[:body] ||= {}
          first_attempt = true
          begin
            response = @connection.request(request_params(params))
          rescue Excon::Errors::Unauthorized => error
            raise error unless first_attempt
            first_attempt = false
            retry
          end

          return parse(response) if parse_json
          response
        end

        private

        def parse(response)
          return response if response.body.empty?
          response.body = Fog::JSON.decode(response.body)
          response
        end

      end

      class Mock

      end
    end
  end
end