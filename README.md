# Shoppe Example Store

This is a Rails application which builds an entire e-commerce store with a lovely design
which can be used as a template for building new stores or just for exploring the 
functionality provided by the Shoppe platform.

## Getting Started

To get started using the example store provided here is simple. Just follow the instructions
below and you'll be up and running in minutes with a demo store with demo data.

```
$ git clone git://github.com/niftyware/shoppe-example.git
$ cd shoppe-example

$ cp config/shoppe.example.yml config/shoppe.yml
# -> Add the appropriate SMTP server configuration to shoppe.yml

$ cp config/database.example.yml config/database.yml
# -> Add the appropriate database configuration to database.yml

$ bundle
$ rake db:migrate shoppe:create_default_user shoppe:seed
$ rails server
```

A few notes about this demo store:

* The store does not currently implement any payment integration. It will ask
  for card details during checkout but these will not be checked.

* The design remains copyright Niftyware Limited. Please do not use the design
  wholesale for any sites you may be developing.

* Once up and running, you can access the Shoppe interface at `/shoppe` and use 
  **admin@example.com** and **password** to login. 
