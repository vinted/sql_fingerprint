# SqlFingerprint

[![Build Status](https://travis-ci.org/vinted/sql_fingerprint.svg?branch=master)](https://travis-ci.org/vinted/sql_fingerprint)

Abstracts SQL query and calculates fingerprint. 
Using fingerprint makes it possible to group similar queries together.

Query rewriting is based on [Percona Toolkit implementation](https://github.com/percona/percona-toolkit/blob/b118e39d1057058b59f0a606946f189f640a693e/lib/QueryRewriter.pm#L147).

## Usage

```ruby
fingerprint = SqlFingerprint.calculate('SELECT * FROM users WHERE id=1')
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

Everyone interacting in the SqlFingerprint project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/vinted/sql_fingerprint/blob/master/CODE_OF_CONDUCT.md).
