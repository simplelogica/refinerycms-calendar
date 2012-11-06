# Calendar extension for Refinery CMS.

This is a calendar gem for refinery forked from (https://github.com/refinery/refinerycms-calendar) with some additional features such as:

  * I18n support in models using Globalize3
  * A calendar helper based on @topfunky's [calendar helper](https://github.com/topfunky/calendar_helper)

## Installation

```ruby
# in Gemfile:
gem 'refinerycms-sl-calendar', '2.0.6'
```

```
# in console:

bundle
rails g refinery:calendar
rake db:migrate db:seed db:test:prepare
```

Restart the server
