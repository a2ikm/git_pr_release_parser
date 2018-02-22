# GitPrReleaseParser

[![Build Status](https://travis-ci.org/a2ikm/git_pr_release_parser.svg?branch=master)](https://travis-ci.org/a2ikm/git_pr_release_parser)

Parse [git-pr-release](https://github.com/motemen/git-pr-release)'s output in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_pr_release_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_pr_release_parser

## Usage

```ruby
require "open3"
require "git_pr_release_parser"

output, status = Open3.capture2e("git-pr-release")
result = GitPrReleaseParser.parse(output)

if result
  puts result.release_pull_request
  result.merged_pull_requests.each do |merged|
    puts merged
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a2ikm/git_pr_release_parser.
