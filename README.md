# Juno

A simple "Workflow" service utility belt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Juno', github: "RepPro/Juno"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Juno

## Usage

Juno current provides two composable utilties.

###Juno.active_record

Provides a single helper, `transact!`, to deal with active record transactions and handling failure.
```ruby
class Create
  include Juno.active_record

  def call
    transact! {@user.create!(name: "James Brown")}
  end
end
```

Transact will wrap the passed in block in an `ActiveRecord::Base.transaction` and rescue the exception. That exception will then be pushed into a `@errors` ivar.

###Juno.service

Provides a set of helpers to construct workflows.

```ruby
class Create
  include Juno.service

  def call
    do_something
  end
end
```

By including `Juno.service` you will get the following:

1. A `.call` class method with wildcard arity that will instantiate your class and pass all args to your `call` method.
2. `attr_reader` for `params` and `errors`
3. A `_params` method to unwrap your params if they are still an instance of `StrongParams`.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RepPro/Juno.

