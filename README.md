# Deployment

Run from the `tracker-backend` directory:
`LOGS_PHOTO_BUCKET_NAME=<BUCKET_NAME_HERE> LOGS_DB_URI=postgresql://<USERNAME>:<PASSWORD>@<DB_ADDRESS>:<DB_PORT>/<DB_NAME> ENV/bin/gunicorn -b 0.0.0.0:443 --certfile <DIRECTORY_TO_CERT_FILE>/fullchain.pem --keyfile <DIRECTORY_TO_KEY_FILE>/privkey.pem fitnessapp:app`
