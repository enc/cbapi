# Cbapi

Interface to Crunchbase. Use to search and view products and
companies. Not all features supported.

## Installation

Add this line to your application's Gemfile:

    gem 'cbapi', :github => 'enc/cbapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cbapi, :git => 'git://github.com/enc/cbapi.git'

## Usage

Set your API key.
  Cbapi::API.key = 'whatever'

Search
  interface = Cbapi::Search.new
  interface.search "Facebook"

Get specific Object
  company = Cbapi::Company.new
  company.get 'facebook'

## Contributing

1. Fork it ( http://github.com/<my-github-username>/cbapi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
