module Cbapi
  class Company < Base

    set_entity "company"
    define_property :name
    define_property :first_name
    define_property :last_name
    define_property :overview
    define_property :crunchbase_url
    define_array :people, :relationships, Cbapi::Person
    def title
      if name
        name
      else
        first_name + last_name
      end
    end
  end
end
