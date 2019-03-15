#!/bin/bash

git clone https://github.com/temporaryorgname/tracker-backend.git
git clone https://github.com/temporaryorgname/tracker-frontend.git

# Install required packages
apt-get update
apt-get --assume-yes install npm python3 virtualenv

# Setup repo
cd tracker-frontend
npm install
npm run build
cd ../tracker-backend/fitnessapp
virtualenv ENV
source ENV/bin/activate
pip3 install -r requirements.txt
mkdir -p static
cd static
cp -r ../../../tracker-frontend/build/* .
