# CPTEC/INPE forecast

[![Build Status](https://travis-ci.org/t4deu/cptec_inpe.svg?branch=master)](https://travis-ci.org/t4deu/cptec_inpe)
[![Coverage Status](https://coveralls.io/repos/t4deu/cptec_inpe/badge.svg?branch=master&service=github)](https://coveralls.io/github/t4deu/cptec_inpe?branch=master)
[![security](https://hakiri.io/github/t4deu/cptec_inpe/master.svg)](https://hakiri.io/github/t4deu/cptec_inpe/master)

Api Client gem for the CPTEC/INPE weather forecast.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cptec_inpe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cptec_inpe

## Usage

```ruby
  require 'cptec_inpe'

  client = CptecInpe.new "Rio de janeiro"

  client.location = "São Paulo" # Change current location
  client.forecast               # List of next days weather forecast
  client.waves_today            # Today waves forecast
  client.waves_next_days        # List of next days waves forecast
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/t4deu/cptec_inpe.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

