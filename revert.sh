#!/bin/bash
# Revert to the commits in ./commit-ids.sh

source ./commit-ids.sh
cd tracker-backend
git fetch
git reset --hard $BACKEND_COMMIT_ID
cd ../tracker-frontend
git fetch
git reset --hard $FRONTEND_COMMIT_ID
npm run build
cd ../tracker-backend/fitnessapp
mkdir -p static
cd static
rm -rf *
cp -r ../../../tracker-frontend/build/* .
