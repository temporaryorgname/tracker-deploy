#!/bin/bash

git clone https://github.com/temporaryorgname/tracker-backend.git
git clone https://github.com/temporaryorgname/tracker-frontend.git
git clone https://github.com/temporaryorgname/assets.git

cd tracker-frontend
cd src
mkdir images
cp ../../assets/background.jpeg images
cd ..
npm install
npm run build
cd ../tracker-backend/fitnessapp
mkdir static
cd static
cp -r ../../../tracker-frontend/build/* .
