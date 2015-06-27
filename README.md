This is a Rails application which has been built using
[Shoppe](http://github.com/tryshoppe/core). It features a lovely design to fully
demonstrate the functionality provided by the Shoppe platform and how well it works
with a Rails application.

![Example UI](http://s.adamcooke.io/OlRNo.png)

## Getting Started

To get started using the example store provided here is simple. Just follow the instructions
below and you'll be up and running in minutes with a demo store with demo data.

```
$ git clone git://github.com/niftyware/shoppe-example.git
$ cd shoppe-example

$ cp config/database.example.yml config/database.yml
# -> Add the appropriate database configuration to database.yml

$ bundle
$ rake db:schema:load shoppe:setup shoppe:seed
$ rails server
```

A few notes about this demo store:

* The store does not currently implement any payment integration. It will ask
  for card details during checkout but these will not be checked (or submitted).

* The design remains copyright aTech Media Limited. Please do not use the design
  wholesale for any sites you may be developing.

* Once up and running, you can access the Shoppe interface at `/shoppe` and use
  **admin@example.com** and **password** to login.
