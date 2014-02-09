module Cbapi
  class Company < Base

    set_entity "company"
    define_property :name
    define_property :overview
  end
end
