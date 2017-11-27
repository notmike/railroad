# railroad
Online Train Reservation System

## Development setup

Retrieve our project (if you haven't done so already)
```
$ git clone https://github.com/notmike/railroad.git
$ cd railroad
```

We use [Virtualenv](https://virtualenv.pypa.io/en/stable/) to manage different Python (we will be using python3) environments.

```
$ pip install virtualenv
$ virtualenv venv
$ source ./venv/bin/activate
```
Now your terminal should look like ...
```
(venv)railroad_proj $
```

Install dependencies in your environment
```
$ pip install -r requirements.txt
```

Confirm the requirements packages installed:
```
$ pip list
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

Copy 'settings-sample.py' and save as 'settings.py':
```
cp ./railroad/settings-sample.py ./railroad/settings.py
```

Now edit the django settings file:
```
vim ./railroad/settings.py
```
Edit the "DATABASES" section near the bottom so 'NAME', 'USER', and 'PASSWORD' are what you previously setup (above).
```
DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'railroad',                     <--- CONFIRM
    'USER': 'railroad',                     <--- CONFIRM
    'PASSWORD':'your-db-user-pw-here',      <--- CONFIRM
    'HOST': 'localhost',
    'PORT': '',
    'OPTIONS': {
        'init_command': "SET sql_mode='STRICT_ALL_TABLES'",
        }
    }
}
```

Save & Exit.

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
