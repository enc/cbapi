module Cbapi
  class Milestone < Base
    define_property :description
    define_property :source_description
    define_property :source_url

    def stoned_date
      @entity['stoned_year'].to_s + '-' +
      @entity['stoned_month'].to_s + '-' +
      @entity['stoned_day'].to_s
    end
  end
end
