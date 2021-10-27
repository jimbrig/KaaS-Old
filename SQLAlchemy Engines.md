---
Date: 2021-10-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: SQLAlchemy Engines
---

Source Type:

# SQLAlchemy Engines

*Source: [Engine Configuration — SQLAlchemy 1.3 Documentation](https://docs.sqlalchemy.org/en/13/core/engines.html)*

The [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") is the starting point for any SQLAlchemy application. It’s “home base” for the actual database and its [DBAPI](https://docs.sqlalchemy.org/en/13/glossary.html#term-DBAPI), delivered to the SQLAlchemy application through a connection pool and a [`Dialect`](https://docs.sqlalchemy.org/en/13/core/internals.html#sqlalchemy.engine.interfaces.Dialect "sqlalchemy.engine.interfaces.Dialect"), which describes how to talk to a specific kind of database/DBAPI combination.

The general structure can be illustrated as follows:

## Engine Configuration

![../_images/sqla_engine_arch.png](https://docs.sqlalchemy.org/en/13/_images/sqla_engine_arch.png)

***

Backlinks:
-	