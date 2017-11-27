# railroad
Online Train Reservation System

## Development setup

We use [Virtualenv](https://virtualenv.pypa.io/en/stable/) to manage different Python (we will be using python3) environments.

```
$ pip install virtualenv
$ mkdir railroad_proj
$ cd railroad_proj
$ virtualenv venv
$ source ./venv/bin/activate
```
Now your terminal should look like ...
```
(venv)railroad_proj $
```

Retrieve our project (if you haven't done so already)
```
$ git clone https://github.com/notmike/railroad.git
```

Install dependencies in your environment
```
$ pip install -r requirements.txt
```

You should already have MariaDB installed locally, we'll setup a new user & db for this project.

For Linux/Mac environment:
```
$ mysql -u root -p
$ CREATE DATABASE railroad;
$ CREATE USER 'railroad'@'localhost' IDENTIFIED BY 'your-user-pw-here';
$ GRANT ALL PRIVILEGES ON railroad.* TO 'railroad'@'localhost';
$ FLUSH PRIVILEGES;
$ exit;
```

Now navigate to our django (sample) settings file:
```
vim ./railroad/settings-sample.py
```
and edit the "DATABASES" section near the bottom so your database/user names and passwords are what you previously setup (above).

**Once finished, save the file as `settings.py`**

Make and run [migrations](https://docs.djangoproject.com/en/1.11/topics/migrations/)
```
$ python manage.py makemigrations railroad
$ python manage.py makemigrations
$ python manage.py migrate
```

Create Django superuser so you can access the admin portal
```
$ python manage.py createsuperuser
```

Start server
```
$ python manage.py runserver
```

You can login to the Admin backend by going to
`http://127.0.0.1:8000/admin`
and using the superuser login you just created.

### Credits
Boostrap Theme: http://www.templatewire.com/interact-free-one-page-bootstrap-template
