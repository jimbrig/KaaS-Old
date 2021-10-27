---
Date: 2021-10-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: SQLAlchemy
---

Source Type: #Type/Documentation

# SQLAlchemy

*Source: [SQLAlchemy Documentation — SQLAlchemy 1.4 Documentation](https://docs.sqlalchemy.org/en/14/index.html)*

Other sources used:
- [SQLAlchemy engine, connection and session difference](https://stackoverflow.com/questions/34322471/sqlalchemy-engine-connection-and-session-difference)
- [Working with Engines and Connections — SQLAlchemy 1.3 Documentation](https://docs.sqlalchemy.org/en/13/core/connections.html)
- [Flask and Databases — Python Beginners documentation](https://python-adv-web-apps.readthedocs.io/en/latest/flask_db1.html)

## SQLAlchemy Overview

*SQLAlchemy* can be used to add database functionality to a [[Python Flask]] Application.

**SQLAlchemy** is a Python SQL toolkit and object relational mapper (ORM) that enables Python to communicate with the SQL database system you prefer: MySQL, PostgreSQL, SQLite, and others. An ORM converts data between incompatible systems (object structure in Python, table structure in SQL database). SQLAlchemy is basically a **bridge** between Python and a SQL database.

**Flask-SQLAlchemy** is an _extension_ for Flask that adds SQLAlchemy to your Flask app.
-   [SQLAlchemy documentation](https://www.sqlalchemy.org/)
-   [Flask-SQLAlchemy documentation](https://flask-sqlalchemy.palletsprojects.com/)
-   [Code on GitHub](https://github.com/macloo/python-adv-web-apps/tree/master/python_code_examples/flask/databases)

## Setup Flask-SQLAlchemy

We will install the **Flask-SQLAlchemy** extension to enable us to work with a SQL database in Flask. There are many extensions for Flask; each one adds a different set of functions and capabilities. See the [list of Flask extensions](https://flask.palletsprojects.com/en/1.1.x/extensions/) for more.

In Terminal, change into your Flask projects folder and **activate your virtual environment** there:

```powershell
python -m venv ./venv
./venv/Scripts/activate
pip install flask-sqlalchemy
```

Then you can update your `requirements.txt` via:

```powershell
pip freeze -r -l > requirements.txt
```

and next time just run:

```powershell
python -m venv ./venv
./venv/Scripts/activate
pip install -r requirements.txt
```

before initiating the application:

```powershell
python main.py
```

### Databases and Flask Basics

You’ll _connect_ your Flask app to an existing SQL database. Connecting will require your own database username and database password, _unless_ using SQLite.

*Note: You _can_ create the SQL database using Python, but _that is not required._ If you already have a database, all you need to worry about is how to connect it. If you _do_ use Python to create a SQL database (and that’s an “if,” not a necessity), you will only do it once. You don’t create the same database again and again. Yes, this seems like a no-brainer — but you need to think about what your code is _doing._*

[Details about writing queries with Flask-SQLAlchemy.](https://flask-sqlalchemy.palletsprojects.com/en/2.x/queries/#querying-records)

See [Flask: Web Forms](https://python-adv-web-apps.readthedocs.io/en/latest/flask_forms.html) if you need to create a web form in your Flask app.

For all Python and SQL commands, refer to the links listed under “User’s Guide” in the [Flask-SQLAlchemy documentation](https://flask-sqlalchemy.palletsprojects.com/).

## Connection

The first step, assuming you have a database, is getting your app (or a starter script for your app) to **connect** to the database. **Do this first.**

Here’s a starter script for testing whether you can connect:

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text

app = Flask(__name__)

# name of database
db_name = '<dbname>'

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pyodbc://' + username + ':' + password + '@' + server + db_name 
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

# this variable, db, will be used for all SQLAlchemy commands
db = SQLAlchemy(app)

# NOTHING BELOW THIS LINE NEEDS TO CHANGE
# this route will test the database connection and nothing more
@app.route('/')
def testdb():
    try:
        db.session.query(text('1')).from_statement(text('SELECT 1')).all()
        return '<h1>It works.</h1>'
    except Exception as e:
        # e holds description of the error
        error_text = "<p>The error:<br>" + str(e) + "</p>"
        hed = '<h1>Something is broken.</h1>'
        return hed + error_text

if __name__ == '__main__':
    app.run(debug=True)
```

## Setting Environment Variables

Instead of including username, password, and the whole database connection string _within a Python script,_ you can set the complete string as an **environment variable.** Note that the connection string must be complete and correct for your configuration, as discussed in the previous section.

If you set an environment variable for the connection string, then add the following lines near the top of your script:

```python
import os
# check for environment variable
if not os.getenv("DATABASE_URL"):
    raise RuntimeError("DATABASE_URL is not set")
```

Eliminate all lines that refer to username, password, server, and database name.

Change the `app.config` statement to this:

```python
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv("DATABASE_URL")
```

## Troubleshooting

If you cannot get your Flask app to connect to your database, check the following:

-   You forgot to install something (Flask-SQLAlchemy, or PyMySQL, etc.) in your Python virtual environment.
-   Your virtual environment has not been activated.
-   Your username and/or password for the database are wrong.
-   Your database name is incorrect.
-   On a remote server, permissions for the database user are not set correctly.
-   For a local database, the socket does not match what you need on your computer.
-   For a local MySQL database, you have not started the MySQL server.

## Reading from Database

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# each table in the database needs a class to be created for it
# db.Model is required - don't change it
# identify all columns by name and data type
class Sock(db.Model):
 __tablename__ = 'socks' id = db.Column(db.Integer, primary_key=True) name = db.Column(db.String) style = db.Column(db.String) color = db.Column(db.String) quantity = db.Column(db.Integer) price = db.Column(db.Float) updated = db.Column(db.String) 
```

[See all possible data types here.](https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#simple-example)
[The entire app, including its templates and the database file, is here.](https://github.com/macloo/python-adv-web-apps/tree/master/python_code_examples/flask/databases/flask_db_read)
Search on the [Query API page](https://docs.sqlalchemy.org/en/13/orm/query.html) in the SQLAlchemy documentation when you need to work out the syntax for an unusual query.

Flask forms using **Flask-WTF** and **Flask-Bootstrap4** were introduced in the chapter [Flask: Web Forms](https://python-adv-web-apps.readthedocs.io/en/latest/flask_forms.html). See [the code for this form](https://python-adv-web-apps.readthedocs.io/en/latest/flask_db3.html#the-form-without-validators) below.

***

Backlinks:
-	