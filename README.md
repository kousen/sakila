sakila
======

Grails app that maps the Sakila sample database from MySQL.

The domain model consists of the classes in `grails-app/domain`, as usual. All associations
are defined as bi-directional one-to-many, except for `film/actor` and `film/category`, 
which are many-to-many. All mappings were done by hand rather than use a domain class
generator.

All controllers currently use dynamic scaffolding.

The `StoredProcService` and `FunctionService` classes contain methods to invoke the built-in
stored procedures and functions from Sakila. Integration tests are provided to demonstrate
they are working properly.

Ken Kousen  
[ken.kousen@kousenit.com](mailto:ken.kousen@kousenit.com)  
[http://www.kousenit.com](http://www.kousenit.com)  
