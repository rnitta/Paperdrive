# Paperdrive

Paperdrive is the unofficial [Pipedrive](https://www.pipedrive.com/) API wrapper gem.

## Installation

Add this line to your application's Gemfile (Recommended):

```ruby
gem 'paperdrive'
```

```shell
$ bundle install
```

Or install it to your global:

```shell
$ gem install paperdrive
```

## Usage

First, you should get API Token from Pipedrive dashboard.

Then,

```ruby
require 'paperdrive'

client = Paperdrive::Client.new(token: 'your_token_here')
# or setting token to ENV['PAPERDRIVE_TOKEN'] and you can initialize with `Paperdrive::Client.new`.

client.all_activities(user_id: 1, limit: 1, done: 0)
# => { :rate_limit => {...}, :header => {...}, body => {...} }
```

Now This gem is supporting only ["Activities"](https://developers.pipedrive.com/docs/api/v1/#!/Activities),  
But you can access other APIs with `Paperdrive::Client::General`

like:

```ruby
# client.general_<get|post|put|delete> (path, *parameters)
client.general_delete('/deals', ids: [1, 2, 3, 4]) # => DELETE multiple deals in builk
```

Actually, these methods enable you to access all APIs on [API docs](https://developers.pipedrive.com/docs/api/v1/).

## Development

Now developing, and there are very few APIs supported, so I appreciate your help.

## Contributing

Issue/Pull Request Please
