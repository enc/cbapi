module Cbapi
  class Search < Base
    def initialize(js=nil)
      @s_url = 'search.js?query=<>&page=<>'
      super
    end
  end
end
