module Cbapi
  class Base

    def initialize(js = nil)
      @entity = js
      @url = "<>/<>.js"
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
    def self.define_property(name)
      define_method(name) do
        if @entity
          @entity[name.to_s]
        else
          nil
        end
      end
    end
    def get(*something)
      @entity = API.retrieve(get_url(*something))
    end
    def entity
      @entity
    end
  end
end
