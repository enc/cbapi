module Cbapi
  class API

    class << self
      attr_accessor :key
    end

    def self.retrieve(url)
      if self.key
        if url.include? '?'
          url = url + "&api_key=" + self.key
        else
          url = url + "?api_key=" + self.key
        end
      end
      JSON.parse(get_url(url))

    end

    def self.get_url(url)
      uri = URI.parse(url)
      Net::HTTP.get_response(uri).body
    end

  end
end
