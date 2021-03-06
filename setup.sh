#!/bin/bash

git clone https://github.com/temporaryorgname/tracker-backend.git
git clone https://github.com/temporaryorgname/tracker-frontend.git
git clone https://github.com/temporaryorgname/assets.git

# Checkout specific commit ID
source ./commit-ids.sh
cd tracker-backend
git reset --hard $BACKEND_COMMIT_ID
cd ../tracker-frontend
git reset --hard $FRONTEND_COMMIT_ID
cd ..

# Install required packages
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -q --option \"Dpkg::Options::=--force-confold\" --assume-yes install libssl1.1
apt-get --assume-yes install npm python3 virtualenv

# Setup repo
cd tracker-frontend
cd src
mkdir images
cp ../../assets/background.jpeg images
cd ..
npm install npm@latest -g
npm install
npm run build
cd ../tracker-backend
virtualenv ENV -p python3
source ENV/bin/activate
pip install .
cd fitnessapp
mkdir -p static
cd static
cp -r ../../../tracker-frontend/build/* .
