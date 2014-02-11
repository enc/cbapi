module Cbapi
  class Person < Base

    define_property :title
    define_property :name, "person/last_name"
    define_property :first_name, "person/first_name"
    define_property :link_stub , "person/permalink"

    def link
      "http://www.crunchbase.com/person/" + link_stub
    end
  end
end
