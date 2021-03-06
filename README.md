# Paperdrive

Paperdrive is the unofficial [Pipedrive](https://www.pipedrive.com/) API wrapper gem.  
[![](https://img.shields.io/travis/rnitta/Paperdrive/master.svg?style=popout-square)](https://travis-ci.org/rnitta/paperdrive)
[![](https://img.shields.io/gem/v/paperdrive.svg?style=popout-square)](https://rubygems.org/gems/paperdrive)

One day, when I was a kid, I was exploring an old disused outhouse. After a short time search, I found an old computer, which is coated with dust. As I was cleaning it with care, suddenly a ghost did appear from the computer. According to the ghost's statement, He was a programmer in his time, Heian period. And then he said, "You should develop a Pipedrive API wrapper library for Ruby." This is why I developed this.

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
[YARD doc](https://paperdrive-doc.netlify.com/)

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

response.success? #=> true

```

See `Paperdrive::Client` instance methods list [here (document)](https://paperdrive-doc.netlify.com/paperdrive/client)


## Development

Now developing, I appreciate your help.


### TODO
There are few APIs (mainly related to uploading files) still not wrapped.

- ~~Activities~~ (implemented)
- ~~ActivityFields~~ (implemented)
- ~~ActivityTypes~~ (implemented)
- Authorizations
- ~~Currencies~~ (implemented)
- ~~Deals~~ (implemented)
- ~~DealFields~~ (implemented)
- Files
- ~~Filters~~ (implemented)
- ~~GlobalMessages~~ (implemented)
- ~~MailMessages~~ (implemented)
- ~~MailThreads~~ (implemented)
- ~~Notes~~ (implemented)
- ~~NoteFields~~ (implemented)
- ~~OrganizationFields~~ (implemented)
- ~~Organizations~~ (implemented)
- ~~OrganizationRelationships~~ (implemented)
- ~~PermissionSets~~ (implemented)
- Persons (almost implemented)
- ~~PersonFields~~ (implemented)
- ~~Pipelines~~ (implemented)
- ~~Products~~ (implemented)
- ~~ProductFields~~ (implemented)
- ~~Recents~~ (implemented)
- ~~Roles~~ (implemented)
- ~~SearchResults~~ (implemented)
- ~~Stages~~ (implemented)
- ~~Users~~ (implemented)
- ~~UserConnections~~ (implemented)
- ~~UserSettings~~ (implemented)
- ~~Webhooks~~ (implemented)

- specs

## Contributing

Issue/Pull Request Please
