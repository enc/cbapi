module Cbapi
  class Product < Base

    set_entity "product"
    define_property :name
    define_property :overview
    define_property :crunchbase_url
    define_array :milestones, :milestones, Cbapi::Milestone
  end
end
