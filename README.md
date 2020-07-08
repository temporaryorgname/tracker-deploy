# Deployment

## Config

Create `./tracker-backend/instance/config.py`:
```
UPLOAD_FOLDER = '/path/for/temporary/uploaded/files'
SQLALCHEMY_DATABASE_URI='postgresql://<user>:<pass>@<address>/<dbname>'
```

## uWSGISetup

Install packages
```
sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
```

Install `uwsgi`:
```
pip install uwsgi
```

Create `/etc/systemd/system/tracker.service`:
```
[Unit]
Description=uWSGI instance to serve tracker project
After=network.target

[Service]
User=howardh
Group=www-data
WorkingDirectory=/home/howardh/tracker-deploy/tracker-backend
Environment="PATH=/home/howardh/tracker-deploy/tracker-backend/ENV/bin"
ExecStart=/home/howardh/tracker-deploy/tracker-backend/ENV/bin/uwsgi --ini app.ini

[Install]
WantedBy=multi-user.target
```

Start the service and tell it to start on boot:
```
sudo systemctl start tracker
sudo systemctl enable tracker
```

# Nginx

Install
```
sudo apt-get install nginx
```

Create `/etc/nginx/sites-available/tracker`
```
server {
    listen 80;
    server_name your_domain logs.hhixl.net;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/home/howardh/tracker-deploy/tracker-backend/app.sock;
    }
}
```

Enable site
```
sudo ln -s /etc/nginx/sites-available/tracker /etc/nginx/sites-enabled
```

Restart nginx
```
sudo systemctl restart nginx
```

## SSL

```
sudo apt install python-certbot-nginx
sudo certbot --nginx -d logs.hhixl.net --force-renewal
```

## Troubleshooting

```
sudo less /var/log/nginx/error.log
sudo less /var/log/nginx/access.log
sudo journalctl -u nginx
sudo journalctl -u tracker
```
