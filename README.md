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

```
rails generator model category
```

```
create_table :categories do |t|
  t.string :name
  t.string :model
  t.string :context
  t.references :resource, :polymorphic => true
  t.timestamps
end
```

```
class Category < ActiveRecord::Base
  attr_accessible :name
  acts_as_category
end

class Forum < ActiveRecord::Base
  attr_accessible :name
end

class Topic < ActiveRecord::Base
  attr_accessible :title
end
```

```
Category.used_for
Category.used_for('category')
Category.used_for(Topic)
Category.used_for(Topic, 'category')
Category.used_for(Topic, 'location')
Category.used_for(@forum)
Category.used_for(@forum, 'location')
Category.used_for(@forum, Topic)
Category.used_for(@forum, Topic, 'location')
``` 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
