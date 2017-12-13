# SqlFingerprint

Abstracts SQL query and calculates fingerprint. 
Using fingerprint makes it possible to group similar queries together.

## Usage

```ruby
fingerprint = SqlFingerprint.calculate('SELECT * FROM users=1')
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sql_fingerprint'
```

Or install it yourself as:

    $ gem install sql_fingerprint

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SqlFingerprint project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sql_fingerprint/blob/master/CODE_OF_CONDUCT.md).
