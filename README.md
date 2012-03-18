# paresseux

paresseux is a lazy migration tool for active model aware model.

# Installation

Ruby 1.9.2 is required, and 1.9.3 is recommanded.

Install it with rubygems:

    gem install paresseux

With bundler, add it to your `Gemfile`:

``` ruby
gem "paresseux", "~>0.0.2"
```

# Usage

Include `Mongoid::Paresseux` in your active model classes.

``` ruby
class Article
  # Define current version of mapping at the very top.
  VERSION = 3

  include Mongoid::Document
  include Mongoid::Paresseux
end
```

Next step : creating a class responsible for data migration. Naming convention here is to add `Paresseux` to current class name.
In a rails project, adding thoses files to `app/migrations` makes sense.

``` ruby
class ArticleParesseux < Paresseux::Migration
  def migration_1_to_2
    # updating data
    model.slug = new_slug
  end

  def migration_2_to_3
    # updating data
  end

  # and so on...
end
```

In this example, `ArticleParesseux` have access to article instance through the `model` method, and target version with `version` method. `migration_1_to_2` and `migration_2_to_3` will be called before a save is performed.


# Status

* It's more a POC than anything.
* Not used in production... yet.
* Only mongoid is supported.


# Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself in another branch so I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


# Copyright

MIT. See LICENSE for further details.
