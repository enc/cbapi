module Cbapi
  class API

    class << self
      attr_accessor :key
    end

    def self.retrieve(url)
      JSON.parse(get_url(add_key(url)))

    end

    def self.get_url(url)
      uri = URI.parse(url)
      Net::HTTP.get_response(uri).body
    end
    def self.add_key(url)

      if self.key
        if url.include? '?'
          url = url + "&api_key=" + self.key
        else
          url = url + "?api_key=" + self.key
        end
      end
      return url
    end

    def self.retrieve_page_list(url)
      content = JSON.parse(get_url(add_key(url)))
      return content["results"]
    end

  end
end
