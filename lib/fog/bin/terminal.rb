class Terminal < Fog::Bin
  class << self
    def class_for(key)
      case key
      when :compute
        Fog::Compute::Terminal
      else
        raise ArgumentError, "Unrecognized service: #{key}"
      end
    end

    def [](service)
      @@connections ||= Hash.new do |hash, key|
        hash[key] = case key
        when :compute
          Fog::Compute.new(:provider => 'Terminal')
        else
          raise ArgumentError, "Unrecognized service: #{key.inspect}"
        end
      end
      @@connections[service]
    end

    def services
      Fog::Terminal.services
    end
  end
end
