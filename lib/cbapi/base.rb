module Cbapi
  class Base

    def cb_url(url_string)
      @url = url_string
    end

    def get_url(*parameters)
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
