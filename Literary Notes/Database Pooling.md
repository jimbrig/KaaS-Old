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

Avoid the naive approach of creating and closing out a new database connection for each and every web request your client application/API sends to the server. Also, avoid the other side where a global session-wide connect

***

Backlinks:
-	