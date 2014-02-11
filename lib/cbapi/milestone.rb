module Cbapi
  class Milestone < Base
    define_property :desciption
    define_property :source_description
    define_property :source_url

    def stoned_date
      @entity['stoned_year'] + '-' +
      @entity['stoned_month'] + '-' +
      @entity['stoned_day']
    end
  end
end
