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
# => #<Paperdrive::Response>
```


## Development

Now developing, and there are very few APIs supported, so I appreciate your help.


### TODO
Many apis still not wrapped

- ~~Activities~~(implemented)
- ActivityFields
- ActivityTypes
- Authorizations
- Currencies
- Deals
- DealFields
- Files
- Filters
- GlobalMessages
- MailMessages
- MailThreads
- ~~Notes~~(implemented)
- NoteFields
- OrganizationFields
- Organizations
- OrganizationRelationships
- PermissionSets
- Persons
- PersonFields
- Pipelines
- Products
- ProductFields
- Recents
- Roles
- SearchResults
- Stages
- Users
- UserConnections
- UserSettings
- Webhooks

## Contributing

Issue/Pull Request Please
