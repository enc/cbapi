module Cbapi
  class Base

    def initialize(js = nil)
      @entity = js
      @url = "<>/<>.js"
    end

    def set_entity(name)
      @e_name = name
    end

    def cb_url(url_string)
      @url = url_string
    end

    def cb_list_url(url_string)

    end

    def get_url(*parameters)
      parameters = parameters.unshift @e_name if @e_name
      "http://api.crunchbase.com/v/1/" + fill_in(parameters)
    end
    def fill_in(parameters)
      result = @url.clone
      parameters.each do |param|
        result["<>"] = param
      end
      return result
    end
    def define_property(name)
      (class << self; self; end).class_eval do
        define_method(name) do
          if @entity
            @entity[name.to_s]
          else
            nil
          end
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
