# Paperdrive ![](https://img.shields.io/travis/rnitta/Paperdrive/master.svg?style=popout-square) ![](https://img.shields.io/gem/v/Paperdrive.svg?style=popout-square)

Paperdrive is the unofficial [Pipedrive](https://www.pipedrive.com/) API wrapper gem.  


## Installation

Add this line to your application's Gemfile (Recommended):

```ruby
gem 'paperdrive'
```

```shell
$ bundle install
```

---

Or install it on your global:

```shell
$ gem install paperdrive
```

## Document
[Yard doc](https://paperdrive-doc.netlify.com/)

## Usage

First, you should get API Token from Pipedrive dashboard.

Then,

```ruby
require 'paperdrive'

client = Paperdrive::Client.new(token: 'your_token_here')
# or setting token to ENV['PAPERDRIVE_TOKEN'] and you can initialize with `Paperdrive::Client.new`.

response = client.all_activities(user_id: 1, done: 1)
# => #<Paperdrive::Response> 

pp response
# =>
# #<Paperdrive::Response:0x00007ff811221b70
# @body=
#   {"success"=>true,
#    "data"=>
#      [{"id"=>0,
#        "company_id"=>000000,
#        "user_id"=>000000,
#        "done"=>false,
#        "type"=>"call",
#        "reference_type"=>nil,
#        "reference_id"=>nil,
#        "due_date"=>"2019-01-08",
#        "due_time"=>"",
#        "duration"=>"",
#        "add_time"=>"2019-01-08 20:28:31",
#        "marked_as_done_time"=>"",
#        "last_notification_time"=>nil,
#        "last_notification_user_id"=>nil,
#        "notification_language_id"=>nil,
#        "subject"=>"Call",
#        ...

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
