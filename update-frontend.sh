#!/bin/bash

cd tracker-frontend
git pull
#npm install
npm run build
cd ../tracker-backend/fitnessapp
mkdir -p static
cd static
rm -rf *
cp -r ../../../tracker-frontend/build/* .
