# Alphanso

This gem will help to determine deletion date based on defined plans and policy

## Installation

Build gem:

```ruby
gem build alphanso.gemspec
```


And then execute:

    $ gem install alphanso-0.1.0.gem

## Usage

```ruby
require 'alphanso'

date = Date.parse('2010-01-03')
deletion_date = Alphanso::RetentionPolicy.deletion_date('Standard', date)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/alphanso. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/alphanso/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Alphanso project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/alphanso/blob/master/CODE_OF_CONDUCT.md).
