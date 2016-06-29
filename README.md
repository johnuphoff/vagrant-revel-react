# Vagrant Revel React

## Setup

- Download and Install Vagrant from https://www.vagrantup.com/downloads.html
- Download and Install VirtualBox from https://www.virtualbox.org/wiki/Downloads
- In the project root run 'vagrant up'.
- When provisioning is complete, run 'vagrant ssh' to enter the box.

## Run

- from inside your vagrant box, run `revel run ease`
- you can hit the app at http://33.33.33.33

---------

# Welcome to Revel

## Getting Started

A high-productivity web framework for the [Go language](http://www.golang.org/).


### The Go Language

##### How To Write Go Code
https://golang.org/doc/code.html

##### Effective Go
https://golang.org/doc/effective_go.html


### Start the web server:

    revel run myapp

   Run with <tt>--help</tt> for options.

### Go to http://localhost:9000/ or http://33.33.33.33 and you'll see the sample react todo mvc:
http://todomvc.com/examples/react/

### Description of Contents

The default directory structure of a generated Revel application:

    myapp               App root
      app               App sources
        controllers     App controllers
          init.go       Interceptor registration
        models          App domain models
        routes          Reverse routes (generated code)
        views           Templates
      tests             Test suites
      conf              Configuration files
        app.conf        Main configuration file
        routes          Routes definition
      messages          Message files
      public            Public assets
        css             CSS files
        js              Javascript files
        images          Image files

app

    The app directory contains the source code and templates for your application.

conf

    The conf directory contains the application’s configuration files. There are two main configuration files:

    * app.conf, the main configuration file for the application, which contains standard configuration parameters
    * routes, the routes definition file.


messages

    The messages directory contains all localized message files.

public

    Resources stored in the public directory are static assets that are served directly by the Web server. Typically it is split into three standard sub-directories for images, CSS stylesheets and JavaScript files.

    The names of these directories may be anything; the developer need only update the routes.

test

    Tests are kept in the tests directory. Revel provides a testing framework that makes it easy to write and run functional tests against your application.

### Follow the guidelines to start developing your application:

* The README file created within your application.
* The [Getting Started with Revel](http://revel.github.io/tutorial/index.html).
* The [Revel guides](http://revel.github.io/manual/index.html).
* The [Revel sample apps](http://revel.github.io/samples/index.html).
* The [API documentation](http://revel.github.io/docs/godoc/index.html).

## Contributing
We encourage you to contribute to Revel! Please check out the [Contributing to Revel
guide](https://github.com/revel/revel/blob/master/CONTRIBUTING.md) for guidelines about how
to proceed. [Join us](https://groups.google.com/forum/#!forum/revel-framework)!
