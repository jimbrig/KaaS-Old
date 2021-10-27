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

Where above, an [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") references both a [`Dialect`](https://docs.sqlalchemy.org/en/13/core/internals.html#sqlalchemy.engine.interfaces.Dialect "sqlalchemy.engine.interfaces.Dialect") and a [`Pool`](https://docs.sqlalchemy.org/en/13/core/pooling.html#sqlalchemy.pool.Pool "sqlalchemy.pool.Pool"), which together interpret the DBAPI’s module functions as well as the behavior of the database.

Creating an engine is just a matter of issuing a single call, [`create_engine()`](https://docs.sqlalchemy.org/en/13/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine"):

```python
from sqlalchemy import create_engine
engine = create_engine('postgresql://scott:tiger@localhost:5432/mydatabase')
```

The above engine creates a [`Dialect`](https://docs.sqlalchemy.org/en/13/core/internals.html#sqlalchemy.engine.interfaces.Dialect "sqlalchemy.engine.interfaces.Dialect") object tailored towards PostgreSQL, as well as a [`Pool`](https://docs.sqlalchemy.org/en/13/core/pooling.html#sqlalchemy.pool.Pool "sqlalchemy.pool.Pool") object which will establish a DBAPI connection at `localhost:5432` when a connection request is first received. Note that the [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") and its underlying [`Pool`](https://docs.sqlalchemy.org/en/13/core/pooling.html#sqlalchemy.pool.Pool "sqlalchemy.pool.Pool") do **not** establish the first actual DBAPI connection until the [`Engine.connect()`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine.connect "sqlalchemy.engine.Engine.connect") method is called, or an operation which is dependent on this method such as [`Engine.execute()`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine.execute "sqlalchemy.engine.Engine.execute") is invoked. In this way, [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") and [`Pool`](https://docs.sqlalchemy.org/en/13/core/pooling.html#sqlalchemy.pool.Pool "sqlalchemy.pool.Pool") can be said to have a _lazy initialization_ behavior.

The [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine"), once created, can either be used directly to interact with the database, or can be passed to a [`Session`](https://docs.sqlalchemy.org/en/13/orm/session_api.html#sqlalchemy.orm.session.Session "sqlalchemy.orm.session.Session") object to work with the ORM. This section covers the details of configuring an [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine"). 

See Also: [Working with Engines and Connections](https://docs.sqlalchemy.org/en/13/core/connections.html), will detail the usage API of the [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") and similar, typically for non-ORM applications.

## Database URLs

The [`create_engine()`](https://docs.sqlalchemy.org/en/13/core/engines.html#sqlalchemy.create_engine "sqlalchemy.create_engine") function produces an [`Engine`](https://docs.sqlalchemy.org/en/13/core/connections.html#sqlalchemy.engine.Engine "sqlalchemy.engine.Engine") object based on a URL. These URLs follow [RFC-1738](http://rfc.net/rfc1738.html), and usually can include username, password, hostname, database name as well as optional keyword arguments for additional configuration. In some cases a file path is accepted, and in others a “data source name” replaces the “host” and “database” portions. 

The typical form of a database URL is: `dialect+driver://username:password@host:port/database`

Dialect names include the identifying name of the [[SQLAlchemy]] dialect, a name such as `sqlite`, `mysql`, `postgresql`, `oracle`, or `mssql`. 

The drivername is the name of the DBAPI to be used to connect to the database using all lowercase letters. If not specified, a “default” DBAPI will be imported if available - this default is typically the most widely known driver available for that backend.

As the URL is like any other URL, **special characters such as those that may be used in the password need to be URL encoded to be parsed correctly.**. Below is an example of a URL that includes the password `"kx%jj5/g"`, where the percent sign and slash characters are represented as `%25` and `%2F`, respectively:

`postgresql+pg8000://dbuser:kx%25jj5%2Fg@pghost10/appdb`

The encoding for the above password can be generated using [urllib.parse](https://docs.python.org/3/library/urllib.parse.html):

```python
>>> import urllib.parse
>>> urllib.parse.quote_plus("kx%jj5/g")
'kx%25jj5%2Fg'
```

For a full index of detailed information on all included dialects as well as links to third-party dialects, see [Dialects](https://docs.sqlalchemy.org/en/13/dialects/index.html).

### PostgreSQL

The PostgreSQL dialect uses `psycopg2` as the default DBAPI. `pg8000` is also available as a pure-Python substitute:

```python
# default
engine = create_engine('postgresql://scott:tiger@localhost/mydatabase')

# psycopg2
engine = create_engine('postgresql+psycopg2://scott:tiger@localhost/mydatabase')

# pg8000
engine = create_engine('postgresql+pg8000://scott:tiger@localhost/mydatabase')
```

More notes on connecting to PostgreSQL at [PostgreSQL](https://docs.sqlalchemy.org/en/13/dialects/postgresql.html).

### MySQL

The MySQL dialect uses `mysql-python` as the default DBAPI. There are many MySQL DBAPIs available, including `MySQL-connector-python` and `OurSQL`:

```python
# default
engine = create_engine('mysql://scott:tiger@localhost/foo')

# mysqlclient (a maintained fork of MySQL-Python)
engine = create_engine('mysql+mysqldb://scott:tiger@localhost/foo')

# PyMySQL
engine = create_engine('mysql+pymysql://scott:tiger@localhost/foo')
```

More notes on connecting to MySQL at [MySQL](https://docs.sqlalchemy.org/en/13/dialects/mysql.html).

### Oracle

The Oracle dialect uses `cx_oracle` as the default DBAPI:

```python
engine = create_engine('oracle://scott:tiger@127.0.0.1:1521/sidname')

engine = create_engine('oracle+cx_oracle://scott:tiger@tnsname')
```

More notes on connecting to Oracle at [Oracle](https://docs.sqlalchemy.org/en/13/dialects/oracle.html).

### Microsoft SQL Server

The SQL Server dialect uses `pyodbc` as the default DBAPI. `pymssql` is also available:

```python
# pyodbc
engine = create_engine('mssql+pyodbc://scott:tiger@mydsn')

# pymssql
engine = create_engine('mssql+pymssql://scott:tiger@hostname:port/dbname')
```

More notes on connecting to SQL Server at [Microsoft SQL Server](https://docs.sqlalchemy.org/en/13/dialects/mssql.html).

### SQLite

SQLite connects to file-based databases, using the Python built-in module `sqlite3` by default.

As SQLite connects to local files, the URL format is slightly different. The “file” portion of the URL is the filename of the database. For a relative file path, this requires three slashes:

```python
# sqlite://<nohostname>/<path>
# where <path> is relative:
engine = create_engine('sqlite:///foo.db')
```

And for an absolute file path, the three slashes are followed by the absolute path:

```python
# Unix/Mac - 4 initial slashes in total
engine = create_engine('sqlite:////absolute/path/to/foo.db')

# Windows
engine = create_engine('sqlite:///C:\\path\\to\\foo.db')

# Windows alternative using raw string
engine = create_engine(r'sqlite:///C:\path\to\foo.db')
```

To use a SQLite `:memory:` database, specify an empty URL:

```python
engine = create_engine('sqlite://')
```

More notes on connecting to SQLite at [SQLite](https://docs.sqlalchemy.org/en/13/dialects/sqlite.html).

### Others

See [Dialects](https://docs.sqlalchemy.org/en/13/dialects/index.html), the top-level page for all additional dialect documentation.

***

Backlinks:
-	