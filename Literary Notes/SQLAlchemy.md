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




***

Backlinks:
-	