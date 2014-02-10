module Cbapi
  class Base

    def initialize(js = nil)
      @entity = js
      @url = "<>/<>.js"
      @arrbucket = Hash.new
    end

    def self.set_entity(name)
      @e_name = name
    end
    def self.ename
      @e_name
    end
    def ename
      self.class.ename
    end

    def cb_url(url_string)
      @url = url_string
    end

    def cb_list_url(url_string)

    end

    def get_url(*parameters)
      parameters = parameters.unshift ename if ename
      "http://api.crunchbase.com/v/1/" + fill_in(parameters)
    end
    def fill_in(parameters)
      result = @url.clone
      parameters.each do |param|
        result["<>"] = param
      end
      return result
    end
    def self.define_property(*args)
        name = args[0]
        path = [args[0].to_s]
      if args.size >= 2
        path = args[1].split('/')
      end

      define_method(name) do
        t_path = path.clone
        if @entity
          ret = @entity
          while t_path.size > 0
            ret = ret[t_path.shift]
          end
          return ret
        else
          nil
        end
      end
    end
    def self.define_array container, name, klass
      define_method(container) do
        bucket = []
        @entity[name.to_s].each do |item|
          bucket << klass.new(item)
        end
        @arrbucket[container.to_s] = bucket
      end

    end
    def get(*something)
      @entity = API.retrieve(get_url(*something))
    end
    def entity
      @entity
    end
    def images
      return nil unless @entity
      @entity["image"]["available_sizes"].collect {|a| "http://www.crunchbase.com/" + a[1]}
    end
  end
end
