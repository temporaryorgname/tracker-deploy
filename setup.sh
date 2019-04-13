#!/bin/bash

git clone https://github.com/temporaryorgname/tracker-backend.git
git clone https://github.com/temporaryorgname/tracker-frontend.git
git clone https://github.com/temporaryorgname/assets.git

# Install required packages
apt-get update
apt-get --assume-yes install npm python3 virtualenv

# Setup repo
cd tracker-frontend
cd src
mkdir images
cp ../../assets/background.jpeg images
cd ..
npm install
npm run build
cd ../tracker-backend
virtualenv ENV -p python3
source ENV/bin/activate
pip3 install -r requirements.txt
cd fitnessapp
mkdir -p static
cd static
cp -r ../../../tracker-frontend/build/* .
