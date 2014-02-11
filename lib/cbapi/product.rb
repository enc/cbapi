module Cbapi
  class Product < Base

    set_entity "product"
    define_property :name
    define_property :overview
    define_property :crunshbase_url
  end
end
