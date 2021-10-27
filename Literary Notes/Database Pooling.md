---
Date: 2021-10-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: Database Pooling
---

Source Type: #Type/StackOverflow

# Database Pooling

*Source: [How to preserve database connection in a python web server](https://stackoverflow.com/questions/6688413/how-to-preserve-database-connection-in-a-python-web-server)*

![[Pasted image 20211027155839.png]]

A database connection pool maintains open a number of connections. The application layer simply takes a connection that is not being used, the connections get released when the application layer doesn't need them anymore. By "released" I mean that they get returned to the pool in order to be used again. 

## Anti-Patterns

Avoid the naive approach of creating and closing out a new database connection for each and every web request your client application/API sends to the server. Also, avoid the other side where a global session-wide, persistent connection is used across all endpoints as this approach can lead to issues with performance and scalability as well as the common pitfall of not closing out the connection when a user leaves then app or it times out. 

## Pooling

Database pooling is a nice middle ground between the two methods mentioned above on how to preserve a database connection properly. 

Instead of opening and closing a connection per request/endpoint, you now acquire and release a connection from the database connection pool. 

In Python you can utilize [PySQLPool](http://packages.python.org/PySQLPool/) for `mysql` for example.

For production applications with Python you should by using [[SQLAlchemy]] with a connection pool configured, even if you are not interested in coding using the native [[SQLAlchemy ORM]]. See [SQLAlchemy in Flask — Flask Documentation (2.0.x)](https://flask.palletsprojects.com/en/2.0.x/patterns/sqlalchemy/#sql-abstraction-layer) for details on setting up a **SQL Abstraction Layer** with [[SQLAlchemy]] and [[Python Flask]].



***

Backlinks:
-	