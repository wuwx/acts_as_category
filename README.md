# ActsAsCategory

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_category'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_category

## Usage

    acts_as_category
    Category.used_by(Topic)
    Category.used_by(@forum)
    @category.used_by?(Topic)
    @category.used_by?(@topic)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
