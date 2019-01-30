#!/bin/bash

git clone https://github.com/howardh/tracker-backend.git
git clone https://github.com/howardh/tracker-frontend.git

cd tracker-frontend
npm install
npm run build
cd ../tracker-backend/fitnessapp
mkdir static
cd static
cp -r ../../../tracker-frontend/build/* .
