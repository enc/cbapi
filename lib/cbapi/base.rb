module Cbapi
  class Base

    def api_key(key)
      @key = key
    end

    def cb_url(url_string)
      @url = url_string
    end

    def get_url(*parameters)
      result = "http://api.crunchbase.com/v/1/" + fill_in(parameters)
      if @key
        return result + "?api_key=" + @key
      else
        return result
      end
    end
    def fill_in(parameters)
      result = @url.clone
      parameters.each do |param|
        result["<>"] = param
      end
      return result
    end
  end
end
