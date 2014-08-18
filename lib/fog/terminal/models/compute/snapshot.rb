require 'fog/core/model'

module Fog
  module Compute
    class Terminal
      class Snapshot < Fog::Model
        identity  :id
        attribute :body
        attribute :title
        attribute :readme
        attribute :tags
        attribute :image
        attribute :diskspace
        attribute :ram
        attribute :public
      end
    end
  end
end
