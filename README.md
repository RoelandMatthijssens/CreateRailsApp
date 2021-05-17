# README

## deploy
* Swap all instances of `createrailsapp` with you app name
* create new masterkey
* run `cap staging deploy` (to create project folders etc)
* create log folder on server `~/projects/applicationnane/shared/log/`
* create tmp folders on server
  * `~/projects/applicationnane/shared/tmp/pids`
  * `~/projects/applicationnane/shared/tmp/sockets/`
* copy masterkey to remote server (`~/projects/applicationname/shared/config/.`
* run `cap staging setup` (to setup postgresql on server)
* run `cap staging puma:config` (to setup puma)
* run `cap staging puma:nginx_config` (to setup nginx)
* ssh into server and run `certbot` as root to configure ssl
  * choose to redirect when asked
  * edit the site-available file to change `proxy_set_header X-Forwarded-Proto http;` to `https`
* restart nginx
* configure dns
* run `cap staging deploy`
* run `cap staging puma:start`

## Included features

* Active Model Form
  * A modular component to create separate form objects that act and can be validated as normal Active Record models. 
  An example is included to show that the form has its own validation. If a letter or number is passed in the wrong field,
  it will not be passed through the validation check in the controller.
* Non DB Model
  * A modular component that allows the creation of models that behave like database / Active Record models without being saved to the database.  The non DB models have the advantage over other functionalities like `Enum` that it allows you to define additional methods on class itself. Use case is illustrated with an `ExampleType` class, that takes an identifier in snake case. In this case, the name method allows us to change the view display within the class by defining the `name` method.
* Rufus and Sucker Punch
  * These gems are included for easier in app job scheduling. Essential and ideal when there is no need for separate threaded job runners that need to be run outside of the rails app like `Sidekiq` and `Resque`.