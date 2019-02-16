# HttpHeaders::ContentType

[![Build Status: master](https://travis-ci.com/XPBytes/http_headers-content_type.svg)](https://travis-ci.com/XPBytes/http_headers-content_type)
[![Gem Version](https://badge.fury.io/rb/http_headers-content_type.svg)](https://badge.fury.io/rb/http_headers-content_type)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

:nut_and_bolt: Utility to parse and sort the "Content-Type" HTTP Header

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'http_headers-content_type'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_headers-content_type

## Usage

You can parse the "Content-Type" header. As per the RFCs, you should really have one (delimited) value but the current 
implementation accepts an array of values. Because there can only be one (1) `Content-Type` per request, it will always
pick the _last_ one, as per the RFCs.

```ruby
require 'http_headers/content_type'

parsed = HttpHeaders::ContentType.new('application/json; charset=utf-8')
parsed.to_s
# => 'application/json; charset=utf-8'
parsed.content_type
# => 'application/json'
parsed.charset
# => 'utf-8'

 
parsed = HttpHeaders::ContentType.new([
  'application/json; charset=utf-8',
  'text/html; charset=utf-8; foo=bar'
])
parsed[:foo]
# => 'bar'
parsed.content_type
# => 'text/html'
parsed.charset
# => 'utf-8'
```

Each parsed value exposes the following methods:
- `content_type`: the parsed content_type
- `charset`: the charset parameter as string, or nil
- `[](parameter)`: accessor for the parameter; throws if it does not exist
- `to_s`: encode back to an entry to be used in a `Content-Type` header

## Related

- [HttpHeaders::Utils](https://github.com/XPBytes/http_headers-utils): :nut_and_bolt: Utility belt for the HttpHeader libraries
- [HttpHeaders::Accept](https://github.com/XPBytes/http_headers-accept): :nut_and_bolt: Utility to parse and sort the "Accept" HTTP Header
- [HttpHeaders::AcceptLanguage](https://github.com/XPBytes/http_headers-accept_language): :nut_and_bolt: Utility to parse and sort the "Accept-Language" HTTP Header
- [HttpHeaders::Link](https://github.com/XPBytes/http_headers-link): :nut_and_bolt: Utility to parse and sort the "Link" HTTP Header

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [XPBytes/http_headers-content_type](https://github.com/XPBytes/http_headers-content_type).
