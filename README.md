concerning-example
==================

Demonstrates that you cannot define class methods using the Concerning gem

Given this class definition:

```ruby
class User < ActiveRecord::Base
  attr_accessible :name

  concerning :Programmers do
    module ClassMethods 
      def programmer?
        true
      end
    end
  end

  module Managers 
    extend ActiveSupport::Concern

    module ClassMethods
      def manager?
        true
      end
    end
  end

  include Managers
end
```

You get this in the console:
```
irb(main):001:0> User.manager?
=> true
irb(main):002:0> User.programmer?
NoMethodError: undefined method `programmer?' for #<Class:0x007f9641beafd0>
	from /Users/johnnaegle/.rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/activerecord-3.2.15/lib/active_record/dynamic_matchers.rb:55:in `method_missing'
	from (irb):2
	from /Users/johnnaegle/.rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/railties-3.2.15/lib/rails/commands/console.rb:47:in `start'
	from /Users/johnnaegle/.rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/railties-3.2.15/lib/rails/commands/console.rb:8:in `start'
	from /Users/johnnaegle/.rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/railties-3.2.15/lib/rails/commands.rb:41:in `<top (required)>'
	from script/rails:6:in `require'
	from script/rails:6:in `<main>'
irb(main):003:0> 

```