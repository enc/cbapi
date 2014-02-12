module Cbapi
  class Base

    def initialize(js = nil)
      @entity = js
      @url = "<>/<>.js"
      @s_url = "search.js?entity=<>&query=<>&page=<>"
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

    def cb_search_url(url_string)
      @s_url = url_string
    end

    def get_url(url, *parameters)
      url = @url unless url
      parameters = parameters.unshift ename if ename
      "http://api.crunchbase.com/v/1/" + fill_in(url, parameters)
    end
    def fill_in(url, parameters)
      result = url.clone
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
    def self.define_search *params

    end
    def search term, page = 1
      set = API.retrieve(get_url(@s_url, term, page.to_s))
      @ssize = set['total']
      return [] unless set["results"]
      set["results"].collect do |i|
        i['smimg'] = extract_image i;
        i
      end
    end
    def get(*something)
      @entity = API.retrieve(get_url(@url, *something))
    end
    def entity
      @entity
    end
    def images
      return nil unless @entity and @entity["image"]
      @entity["image"]["available_sizes"].collect {|a| "http://www.crunchbase.com/" + a[1]}
    end

    def size
      if @ssize
        @ssize
      else
        0
      end
    end

    def extract_image hash
      return nil unless hash["image"]
      hash["image"]["available_sizes"].collect {|a| "http://www.crunchbase.com/" + a[1]} .first


    end
  end
end
